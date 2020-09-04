Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4618D25D938
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 15:03:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07425C3FAD8
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 13:03:51 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE3C0C36B26
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Sep 2020 07:47:17 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id n22so5196186edt.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Sep 2020 00:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXBy1FtjB8ZIWXMxu+RKf2rhNvsO6WBFPA2Nft+JyQY=;
 b=nYL8agt2Ixn97n/TL+6PgLZgPcx3IlpXNQgLtwYD4iRUVeGAM8LXblcbz6RuoHvd/8
 dbatFketi4qTH+kJsxgs6h9L5/amZ7i0OQQ4NwceVaDZTkVcGKkIRKetzf2RI52pDtXT
 qpRI5/DK8qWIpmIpRbnvOu3V82uS7Sw6k9xUy3wUJAsnINOpCdpRMUiWc20Y8ULgh6+0
 J9Ak0hM8ijY5WQFj6YvbbJRWxaW0iVGz57QH/o+cyEEEc0l1g94sV//+/MWayRI6vfIb
 IJ7tbzfdBfSXZeEdJgKjEpxFtXo+4TFaiJjsegGNQGhvYyet7rj+Esc7JjdRKnnyOgV1
 msIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXBy1FtjB8ZIWXMxu+RKf2rhNvsO6WBFPA2Nft+JyQY=;
 b=g/Wvms5KcH0UyQoUcokWkFp7URHZ1oInIPZRu8Azg29tpS3PQBKADUMidbCJ0A/xV3
 /DWA8oGafTwy/0DiIZFaIls8q0qGeOzb9gvSp4Ea/0DDt7sJqJXkKomZ6HZvIjAj/Uyw
 rNMOEHxr4YtsbrkaDBY6etrd6U71900i9u3EAA2Cc7wPhgo2LKo3wLOldS1ugSRfkWjX
 xBA/i7q+qnbkFPwrwEMzoTCbRTeKHmpTPXZPzezIhz3/zaLBQpaeEqc62zQjDyXuQeEr
 noOYmhMm/LyWD3vCsqKIjJJVEtMDORjuvR0zk/fYvlcnV7vILcoBR1Lw5rh52R7zFIf9
 Jq7A==
X-Gm-Message-State: AOAM532euhhVk6Zzmpmwt/KqUdCMSspjmCP1A9a8o5Qu1xhq8/uoR+xu
 AQ+guE2Cbb2zoTtFNflPWAzllg1P2lhihSa2I7gNAA==
X-Google-Smtp-Source: ABdhPJw77IV32gcgIdRrRjFANQLE5labuUZd6AL9Spee9vXj9KJPBaJ5o+5YUlorfqeF24Z7W31cr/kG4Pb2MFfAEdc=
X-Received: by 2002:a50:e79c:: with SMTP id b28mr7364332edn.371.1599205636945; 
 Fri, 04 Sep 2020 00:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200825134206.v3.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
 <0e961a12-3408-87ca-1d64-0a07bad3a4f0@gmx.de>
In-Reply-To: <0e961a12-3408-87ca-1d64-0a07bad3a4f0@gmx.de>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 4 Sep 2020 09:47:06 +0200
Message-ID: <CAN5uoS_HGYpTZaaijzm1=t_e2K96-vvdpzBsVHupDL3K0hcnLA@mail.gmail.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
X-Mailman-Approved-At: Fri, 04 Sep 2020 13:03:49 +0000
Cc: Etienne Carriere <etienne.carriere@st.com>,
 Atish Patra <atish.patra@wdc.com>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bin.meng@windriver.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Rick Chen <rick@andestech.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] fdtdec: optionally add property
 no-map to created reserved memory node
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Heinrich,

On Tue, 25 Aug 2020 at 16:50, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 25.08.20 13:42, Patrice Chotard wrote:
> > From: Etienne Carriere <etienne.carriere@st.com>
> >
> > Add boolean input argument @no_map to helper function
> > fdtdec_add_reserved_memory() to add "no-map" property for an added
> > reserved memory node. This is needed for example when the reserved
> > memory relates to secure memory that the dear Linux kernel shall
> > not even map unless what non-secure world speculative accesses of the
>
> This sentence needs rework. Do you mean "to avoid non-secure world
> accesses of the CPU that might reveal the secure-world memory"?
>
> Is there any evidence that mapping memory as reserved can lead to an
> information leak and that not mapping solves the problem? Is there a CVE
> for it?

There should not be issues related to revealing secure world memory.
Such memory is likely to be protected by a hardware firewall.
Issues are rather due to CPU speculative execution that could emit
read requests to such firewalled memory areas. These read request
would infringe the firewall policy which would likely report a system
error and would possibly panic the system.

By not mapping such memory areas, speculative reads are discarded
before leaving the CPU, at least on Arm architecture.

Note that "no-map" property is also used by Linux to prevent inconsistent
kernel mapping for memories that are mapped non-cached at runtime
by some specific driver. Such memory must be not mapped by the
kernel static memory mapping.

Ok, let's rephrase this commit log. Proposal for the patchset v4:
I hope it looks better:

|  fdtdec: optionally add property no-map to created reserved memory node
|
|  Add boolean input argument @no_map to helper function
|  fdtdec_add_reserved_memory() to add or not "no-map" property
|  for an added reserved memory node.
|
|  Property no-map is used by the Linux kernel to not not map memory
|  in its static memory mapping. It is needed for example for the|
|  consistency of system non-cached memory and to prevent speculative
|  accesses to some firewalled memory.
|
|  No functional change. A later change will update to OPTEE library to
|  add no-map property to OP-TEE reserved memory nodes.
|
| Signed-off-by: (...)


> > CPU can violate the memory firmware configuration.
>
> Most Linux distributions boot via EFI.
>
> In U-Boot's UEFI sub-system we pass reserved memory as
> EFI_RESERVED_MEMORY_TYPE in the memory map to Linux. See function
> efi_carve_out_dt_rsv(). We do not consider the no-map attribute in the
> device-tree.
>
> Does the Linux kernel care about this no-map attribute in the
> device-tree if we are booting via UEFI?

Sorry I lack experience and knowledge on how Linux relies on UEFI versus DT
to describe the system memory. I think the EFI_RESERVED_MEMORY_TYPE
should consider such reserved memory attributes, but I'm far from knowing
how UEFI should handle that.

This is quite a late answer from me. Since your post I saw there are discussion
in this area:
https://lists.linaro.org/pipermail/boot-architecture/2020-September/001389.html


>
> >
> > No function change. A later change will update to OPTEE library to
> > add no-map property to OP-TEE reserved memory nodes.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> > Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> > ---
> >
> > (no changes since v2)
> >
> > Changes in v2:
> >    - fix dm fdtdec test and arch/riscv/lib/fdt_fixup.c with
> >    fdtdec_add_reserved_memory() new parameter
> >
> >  arch/riscv/lib/fdt_fixup.c |  2 +-
> >  include/fdtdec.h           |  5 +++--
> >  lib/fdtdec.c               | 10 ++++++++--
> >  lib/optee/optee.c          |  2 +-
> >  test/dm/fdtdec.c           |  6 +++---
> >  5 files changed, 16 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/riscv/lib/fdt_fixup.c b/arch/riscv/lib/fdt_fixup.c
> > index 5b2420243f..d02062fd5b 100644
> > --- a/arch/riscv/lib/fdt_fixup.c
> > +++ b/arch/riscv/lib/fdt_fixup.c
> > @@ -75,7 +75,7 @@ int riscv_fdt_copy_resv_mem_node(const void *src, void *dst)
> >               pmp_mem.start = addr;
> >               pmp_mem.end = addr + size - 1;
> >               err = fdtdec_add_reserved_memory(dst, basename, &pmp_mem,
> > -                                              &phandle);
> > +                                              &phandle, false);
>
> I guess in a future patch we would want to set nomap=true here too as
> this is the memory reserved by the secure execution environment (e.g.
> OpenSBI).

I think so, yes, but I would prefer RISCV maintainers to comment on that.

Best regards,
Etienne

>
> Best regards
>
> Heinrich
>
> >               if (err < 0 && err != -FDT_ERR_EXISTS) {
> >                       log_err("failed to add reserved memory: %d\n", err);
> >                       return err;
> > diff --git a/include/fdtdec.h b/include/fdtdec.h
> > index bc79389260..f127c7d386 100644
> > --- a/include/fdtdec.h
> > +++ b/include/fdtdec.h
> > (...)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
