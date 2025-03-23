Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C910BA6D152
	for <lists+uboot-stm32@lfdr.de>; Sun, 23 Mar 2025 22:51:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62E2EC7803D;
	Sun, 23 Mar 2025 21:51:33 +0000 (UTC)
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FD6AC7803C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Mar 2025 21:51:31 +0000 (UTC)
X-KPN-MessageId: faa2e0b2-0830-11f0-8ec8-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id faa2e0b2-0830-11f0-8ec8-005056994fde;
 Sun, 23 Mar 2025 22:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=subject:to:from:message-id:date;
 bh=Hgfb62HFuvVbWNgEORCU8n3h0bJ8E7cKnMA21OOpri8=;
 b=XCfG+C13A0fYj02Y+1vtrQcDqfFSKh73gp3dRzYctvxr/KGk5F2kXX0+pISPALvMl43kLAYQInySR
 A3va9RY5dRexa1TBLvoDPvyg38ZGutt3a10oZwBXvPj8mWrXX55ECUPPk3zmHIs1NzJJ+1YlAMwweR
 BO7NbUAyn4BSBeJAxwo0Df6kGB4RgrTpg2zOz4cosf7Nc9/f2Oa100aI/bb6Vlfv+5rcCuqGT8jLWc
 lfab+DBS1Goxc5aaQEXTaIUneVoWNLFqHMMsZ9f4UM45Is9nLEH40Be4TzrTH9OQ5bhY5ObbcBrU2F
 YqrekxYZSygp9qyUXC0G4tHQGQtbHuA==
X-KPN-MID: 33|c+HniJUQD91CZmCH8YqnbAKJS8DTecii5hzmmev6nofmlbNKWsXbN4CoVNat1Mt
 4ONu+LPbBU73dc71ZExXgOOh+Cs42ZGOClvmHLuqIkMQ=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|2pGf20q+Tldu5dqL2jYuCilqO0GXcjfrZFQfYrzz30psHhGmqAY7DZ3G5VMJ3xJ
 OkmvpikC0RQ6EJXuQDERCTQ==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net
 [80.61.163.207]) by smtp.xs4all.nl (Halon) with ESMTPSA
 id f9d1be83-0830-11f0-97b7-00505699d6e5;
 Sun, 23 Mar 2025 22:51:30 +0100 (CET)
Date: Sun, 23 Mar 2025 22:51:29 +0100
Message-Id: <87pli776vy.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
In-Reply-To: <CAC_iWjLY6vytm6UB=Fc3kKpMWQ3=nc19eAi+KjjbwHb9Dfw=VQ@mail.gmail.com>
 (message from Ilias Apalodimas on Mon, 17 Mar 2025 21:06:26 +0200)
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <875xk78wba.fsf@bloch.sibelius.xs4all.nl>
 <CAC_iWjLY6vytm6UB=Fc3kKpMWQ3=nc19eAi+KjjbwHb9Dfw=VQ@mail.gmail.com>
Cc: peng.fan@nxp.com, vincent.stehle@arm.com, u-boot@lists.denx.de,
 jj251510319013@gmail.com, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.rudolph@9elements.com, trini@konsulko.com, udit.agarwal@nxp.com,
 xypron.glpk@gmx.de, Manish.Tomar@nxp.com, Oliver.Gaskell@analog.com,
 wasim.khan@nxp.com, matt@traverse.com.au, duje.mihanovic@skole.hr,
 tien.fong.chee@altera.com, e@freeshell.de, rayagonda.kokatanur@broadcom.com,
 adrianox@gmail.com, Ashish.Kumar@nxp.com, semen.protsenko@linaro.org,
 sumit.garg@kernel.org, sughosh.ganu@linaro.org, alif.zakuan.yuslaimi@intel.com,
 lukas.funke@weidmueller.com, robert.marko@sartura.hr, michal.simek@amd.com,
 mingkai.hu@nxp.com, raymond.mao@linaro.org, caleb.connolly@linaro.org,
 andy.tang@nxp.com, priyanka.jain@nxp.com, sjg@chromium.org,
 maks.mishinfz@gmail.com, meenakshi.aggarwal@nxp.com,
 patrick.delaunay@foss.st.com
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: remove EFI_BOUNCE_BUFFER
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

> From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Date: Mon, 17 Mar 2025 21:06:26 +0200

Hi Ilias,

> Hi Mark,
> Thanks for taking a look
> 
> On Mon, 17 Mar 2025 at 18:18, Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> >
> > > From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > Date: Mon, 17 Mar 2025 15:38:36 +0200
> > >
> > > The EFI subsystem defines its own bounce buffer for devices that
> > > can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
> > > which can be reused instead of defining another symbol.
> > > The only limitation for EFI is that we don't know how big the file a user
> > > chooses to transfer is and as a result we can't depend on allocating the
> > > memory from the malloc area, which can prove too small.
> > >
> > > So allocate an EFI buffer of the correct size and pass it to the DM,
> > > which already supports bounce buffering via bounce_buffer_start_extalign()
> >
> > The existing bounce buffer code servers a completely different purpose
> > though.  It exists to make sure that hardware with cache-incoherent
> > DMA can safely do the required cache flushes.
> >
> > This means that:
> >
> > * SoCs with cache-coherent DMA don't necessarily set BOUNCE_BUFFER.
> >   Looks like you added that option to all the SoCs where you remove
> >   EFI_LOADER_BOUNCE_BUFFER.
> 
> Yes, and that has a side effect I should have probably added to the
> commit message. Using the existing bounce buffer will flush caches
> even if it's pointless.
> 
> >
> > * SoCs that (now) set BOUNCE_BUFFER may double bounce if the buffers
> >   aren't properly aligned.  I suppose that this won't happen since
> >   efi_disk_add_dev() sets medio.io_align to the device block size
> >   which is typically larger than the cache line size.
> 
> I think it won't happen indeed but for a different reason. The EFI
> memory we allocate and pass to bounce_buffer_start_extalign() is
> page-aligned.
> The DM subsystem will call that function with either
> blk_buffer_aligned() which always returns 1 or whatever the device has
> defined. The strictest one I found was the virtio one which requires
> page alignment.
> 
> Allocating memory from EFI is needed, simply because the current
> bounce buffer API will use the malloc area, which might not be enough.
> Do you think the extra cache flush is a no-go and we should leave the
> code as-is?

I think it is undesirable.  I believe it will measurably slow down
loading large files.

So probably best to leave the code as-is.  If somebody really cares,
they should probably separate out the cache flushing code from
CONFIG_BOUNCE_BUFFER first.  And maybe fix the DM bounce buffer code
such that it supports large buffers.

> > Still the commit message is somewhat misleading; this code doesn't
> > really make us use the DM bounce buffering code.
> >
> > I also spotted a few bugs in the implementation.  See below.
> 
> [...]
> 
> > > +++ b/lib/efi_loader/efi_disk.c
> > > @@ -105,6 +105,8 @@ static efi_status_t efi_disk_rw_blocks(struct efi_block_io *this,
> > >       int blksz;
> > >       int blocks;
> > >       unsigned long n;
> > > +     u64 bb = 0xffffffff;
> > > +     void *bb_ptr = buffer;
> > >
> > >       diskobj = container_of(this, struct efi_disk_obj, ops);
> > >       blksz = diskobj->media.block_size;
> > > @@ -113,27 +115,35 @@ static efi_status_t efi_disk_rw_blocks(struct efi_block_io *this,
> > >       EFI_PRINT("blocks=%x lba=%llx blksz=%x dir=%d\n",
> > >                 blocks, lba, blksz, direction);
> > >
> > > +     if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && (uintptr_t)buffer >= SZ_4G + buffer_size - 1) {
> >
> > Shouldn't that check be
> >
> >         if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && (uintptr_t)buffer + buffer_size - 1 >= SZ_4G) {
> >
> > ?
> 
> Yes...
> I originally had (uintptr_t)buffer > SZ_4G - buffer_size - 1 and avoid
> potential overflows, but then I started to think what happens if
> buffer_size is 4GB and completely messed this up ...
> I think it's (uintptr_t)buffer + buffer_size + 1 >= SZ_4G though,
> because SZ_4G is 0x100000000. Anyway yes, you are right, I'll fix it
> in v2, but using subtractions.
> 
> >
> > > +             if (efi_allocate_pages(EFI_ALLOCATE_MAX_ADDRESS, EFI_BOOT_SERVICES_DATA,
> > > +                                    buffer_size >> EFI_PAGE_SHIFT, &bb) != EFI_SUCCESS)
> > > +                     return EFI_OUT_OF_RESOURCES;
> > > +
> > > +             bb_ptr = (void *)(uintptr_t)bb;
> > > +     }
> > >       /* We only support full block access */
> > > -     if (buffer_size & (blksz - 1))
> > > +     if (buffer_size & (blksz - 1)) {
> > > +             if (buffer != bb_ptr)
> > > +                     efi_free_pages(bb, buffer_size >> EFI_PAGE_SHIFT);
> > >               return EFI_BAD_BUFFER_SIZE;
> > > +     }
> >
> > Any reason why you don't check the buffer_size check before allocating
> > the bounce buffer?  That way you don't have to worry about freeing it
> > here.
> 
> Nop, that code was already there and I  didn't move it. I'll move it around.
> 
> >
> > You're missing a memcpy() here in the case direction == EFI_DISK_WRITE.
> 
> ah thanks
> 
> >
> > >       if (CONFIG_IS_ENABLED(PARTITIONS) &&
> > >           device_get_uclass_id(diskobj->header.dev) == UCLASS_PARTITION) {
> > >               if (direction == EFI_DISK_READ)
> 
> [...]
> 
> > > +                     efi_free_pages(bb, buffer_size >> EFI_PAGE_SHIFT);
> > >               return EFI_DEVICE_ERROR;
> > > +     }
> > > +
> > > +     if (buffer != bb_ptr) {
> > > +             memcpy(buffer, bb_ptr, buffer_size);
> >
> > This memcpy() is only necessary if direction == EFI_DISK_READ.
> 
> Ok
> 
> [...]
> 
> Thanks
> /Ilias
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
