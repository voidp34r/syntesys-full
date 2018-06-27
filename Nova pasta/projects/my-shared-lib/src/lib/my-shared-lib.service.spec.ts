import { TestBed, inject } from '@angular/core/testing';

import { MySharedLibService } from './my-shared-lib.service';

describe('MySharedLibService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [MySharedLibService]
    });
  });

  it('should be created', inject([MySharedLibService], (service: MySharedLibService) => {
    expect(service).toBeTruthy();
  }));
});
