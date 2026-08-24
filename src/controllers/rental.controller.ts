import { Request, Response } from 'express';
import { RentalService } from '../services/rental.service';

export class RentalController {
  private rentalService: RentalService;

  constructor() {
    this.rentalService = new RentalService();
  }

  async create(req: Request, res: Response) {
    try {
      const { userId, carId, startDate, endDate } = req.body;
      const rental = await this.rentalService.createRental({ userId, carId, startDate, endDate });
      return res.status(201).json(rental);
    } catch (error: unknown) {
      if (error instanceof Error) {
        return res.status(400).json({ error: error.message });
      }

      return res.status(400).json({ error: 'Erro ao criar aluguel' });
    }
  }

  async complete(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const result = await this.rentalService.completeRental(id as string);
      return res.json(result);
    } catch (error: unknown) {
      if (error instanceof Error) {
        return res.status(400).json({ error: error.message });
      }

      return res.status(400).json({ error: 'Erro ao finalizar aluguel' });
    }
  }
}
