Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF7C9F690F
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 15:51:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DBDDC78011;
	Wed, 18 Dec 2024 14:51:22 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C485BC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 14:51:14 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aa6c0d1833eso1175782966b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 06:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734533474; x=1735138274;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VZKlGmBT4WyWZxMVXwuu/kvQcq2CL2tbi66HOBD/zZ4=;
 b=bVbOLJfT0tD0k5QqIEVyV5veLSo8A3OZL5FKReKejYkJBV2mCUzAaaJpgJFGip0Zkc
 AQqcPlMlQJhVPPEYD3R65UvwfAYO3QsYTgvQ87q6JBrf9OMUCPpCbYPHYS54/F3ukJfw
 AjBLuGNg3mtI7IiFOzvLyetdd/TH65RNe/n4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734533474; x=1735138274;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VZKlGmBT4WyWZxMVXwuu/kvQcq2CL2tbi66HOBD/zZ4=;
 b=g+d5hUDgC312W7RBtkRjHDqS9T8Q4/BO9UlKxUu6AyHpjkLPl6OurPfvs1UiONX9sN
 7frIGBFLYZiylFm0RbDWog6WHzi4RPYnx3z+O5htjEVK7OD7xSLNSlQY5qmR2RxOiWxF
 RFUzHZsZzuJdhQ9n+y1gepiHArX72G/8Vsxr/+n2SfK31irXtZvtYFNm5LVySSDyHW7V
 uSdz74TD/TLUNBI9C5A4n2iz7sDVNu5oyBsKVAaDf2/Y91RFHn25YCG3mQqMDzvunQMd
 WbbxApkvvcwRTFXDtKtOGpamQgOHdYAW5vWwIW8Dp1OK0PdS2cvnayrCUKXYVHbwaSI6
 +mFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg7AqHw18MpTbbMIfPxIKQusks18og0+pWuI9ZN69yv0qwF03cYzNnMJdbaeUYoQZl9T370bfdS0mYDg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwN67GIJIB7xRRgj8rdmQerQ805KRHBnU17Oae75R6/ri1B1MD7
 GyByu4/gz8xEtVXAH6zqYxXWaaJDCCQZqBHijfTUb7IpOOvW9UpYJi9UBAD3Adh3UNVKbfKT1TS
 b/k3ocfnLXdVF07HcY+LsPxACYSfaz2KUNbTj
X-Gm-Gg: ASbGncse5DjTbPOhK8l3UcTXxeqOlsME1Q15j8JrTN7RewAwpfkLQJuw1WYOKv/5Xev
 gUJKmCbc6/ww9B6VWm5KcgZK5u2jX7sLKRtxrXdM=
X-Google-Smtp-Source: AGHT+IE+4DajUBg8Z4ED8zjwizrHYzErPnRho3/QX/v5yPJYqcWiC026l7nR+AejXbnV5PjY0kFkCBvGCmmlIDsmqEY=
X-Received: by 2002:a17:907:c10:b0:aa6:79fa:b487 with SMTP id
 a640c23a62f3a-aabf4716e7emr306927766b.10.1734533474088; Wed, 18 Dec 2024
 06:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20241102174944.412088-1-sjg@chromium.org>
 <20241102174944.412088-2-sjg@chromium.org>
 <280e1d54-89ff-496f-93d3-0de7a9797bc9@foss.st.com>
 <CAFLszTjyxf9m4twDCQw6K99QXA5DmM9nAt-ryH5M3gb5bKyBzg@mail.gmail.com>
 <20241218143028.GX1505244@bill-the-cat>
In-Reply-To: <20241218143028.GX1505244@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 18 Dec 2024 07:50:59 -0700
Message-ID: <CAFLszTgbbeObMRBBuOQ2ansivTENX7wqWBbNbS+XGmUOPJ3fEw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: David Feng <fenghua@phytium.com.cn>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Rick Chen <rick@andestech.com>,
 H Bell <dmoo_dv@protonmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Peng Fan <peng.fan@nxp.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Mark Kettenis <kettenis@openbsd.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Janne Grunau <j@jannau.net>,
 Marek Vasut <marex@denx.de>, Randolph <randolph@andestech.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, E Shattow <lucent@gmail.com>,
 Jerry Van Baren <vanbaren@cideas.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Andre Przywara <andre.przywara@arm.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Sam Day <me@samcday.com>,
 William Zhang <william.zhang@broadcom.com>,
 Matthias Brugger <mbrugger@suse.com>, Francois Berder <fberder@outlook.fr>,
 Tim Harvey <tharvey@gateworks.com>, u-boot-qcom@groups.io,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Green Wan <green.wan@sifive.com>, Minda Chen <minda.chen@starfivetech.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Atish Patra <atishp@atishpatra.org>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Michal Simek <michal.simek@amd.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Eric Curtin <ecurtin@redhat.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Bin Meng <bmeng.cn@gmail.com>, Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] fdt: Swap the signature for
	board_fdt_blob_setup()
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

Hi Tom,

On Wed, 18 Dec 2024 at 07:30, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Dec 17, 2024 at 06:46:37PM -0700, Simon Glass wrote:
> > On Tue, 26 Nov 2024 at 10:10, Patrice CHOTARD
> > <patrice.chotard@foss.st.com> wrote:
> > >
> > >
> > >
> > > On 11/2/24 18:49, Simon Glass wrote:
> > > > This returns a devicetree and updates a parameter with an error code.
> > > > Swap it, since this fits better with the way U-Boot normally works. It
> > > > also (more easily) allows leaving the existing pointer unchanged.
> > > >
> > > > No yaks were harmed in this change, but there is a very small code-size
> > > > reduction.
> > > >
> > > > For sifive, the OF_BOARD option must be set for the function to be
> > > > called, so there is no point in checking it again. Also OF_SEPARATE is
> > > > defined always.
> > > >
> > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > ---
> > > >
> > > > Changes in v2:
> > > > - Set up the existing FDT in case the board wants to check it
> > > > - Update snapdragon to return -EEXIST
> > > > - Set the existing FDT before calling board_fd_blob_setup()
> > > > - Update sandbox to return -EEXIST if an fdt comes from a bloblist
> > > > - Update do_go_uboot() to set the existing FDT
> > > > - Drop unnecessary setting of FDT in vexpress64
> > > > - Tidy up redundant RISC-V code
> > > >
> > > >  arch/arm/mach-apple/board.c                   |  7 ++--
> > > >  arch/arm/mach-snapdragon/board.c              |  9 ++---
> > > >  arch/arm/mach-stm32mp/boot_params.c           | 19 ++++++-----
> > > >  arch/sandbox/cpu/cpu.c                        | 34 +++++++++----------
> > > >  board/Marvell/octeontx/board-fdt.c            | 12 +++----
> > > >  board/Marvell/octeontx2/board-fdt.c           | 12 +++----
> > > >  board/Marvell/octeontx2/board.c               |  3 +-
> > > >  board/andestech/ae350/ae350.c                 | 23 +++++++------
> > > >  board/armltd/vexpress64/vexpress64.c          | 33 ++++++++----------
> > > >  board/broadcom/bcmstb/bcmstb.c                |  7 ++--
> > > >  board/emulation/qemu-arm/qemu-arm.c           |  7 ++--
> > > >  board/emulation/qemu-ppce500/qemu-ppce500.c   | 12 +++----
> > > >  board/emulation/qemu-riscv/qemu-riscv.c       |  7 ++--
> > > >  board/highbank/highbank.c                     |  7 ++--
> > > >  board/raspberrypi/rpi/rpi.c                   | 13 ++++---
> > > >  board/sifive/unleashed/unleashed.c            | 12 +++----
> > > >  board/sifive/unmatched/unmatched.c            | 11 +++---
> > > >  .../visionfive2/starfive_visionfive2.c        | 11 +++---
> > > >  board/xen/xenguest_arm64/xenguest_arm64.c     | 14 ++++----
> > > >  board/xilinx/common/board.c                   | 26 ++++++++------
> > > >  include/fdtdec.h                              |  9 ++---
> > > >  lib/fdtdec.c                                  | 14 +++++---
> > > >  22 files changed, 152 insertions(+), 150 deletions(-)
> > > >
> > > > diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
> > > > index 0b6d290b8ac..2644a04a622 100644
> > > > --- a/arch/arm/mach-apple/board.c
> > > > +++ b/arch/arm/mach-apple/board.c
> > > > @@ -691,11 +691,12 @@ int dram_init_banksize(void)
> > > >
> > > >  extern long fw_dtb_pointer;
> > > >
> > > > -void *board_fdt_blob_setup(int *err)
> > > > +int board_fdt_blob_setup(void **fdtp)
> > > >  {
> > > >       /* Return DTB pointer passed by m1n1 */
> > > > -     *err = 0;
> > > > -     return (void *)fw_dtb_pointer;
> > > > +     *fdtp = (void *)fw_dtb_pointer;
> > > > +
> > > > +     return 0;
> > > >  }
> > > >
> > > >  void build_mem_map(void)
> > > > diff --git a/arch/arm/mach-snapdragon/board.c b/arch/arm/mach-snapdragon/board.c
> > > > index 2ab2ceb5138..cd49de540f0 100644
> > > > --- a/arch/arm/mach-snapdragon/board.c
> > > > +++ b/arch/arm/mach-snapdragon/board.c
> > > > @@ -147,12 +147,12 @@ static void show_psci_version(void)
> > > >   * or for supporting quirky devices where it's easier to leave the downstream DT in place
> > > >   * to improve ABL compatibility. Otherwise, we use the DT provided by ABL.
> > > >   */
> > > > -void *board_fdt_blob_setup(int *err)
> > > > +int board_fdt_blob_setup(void **fdtp)
> > > >  {
> > > >       struct fdt_header *fdt;
> > > >       bool internal_valid, external_valid;
> > > > +     int ret = 0;
> > > >
> > > > -     *err = 0;
> > > >       fdt = (struct fdt_header *)get_prev_bl_fdt_addr();
> > > >       external_valid = fdt && !fdt_check_header(fdt);
> > > >       internal_valid = !fdt_check_header(gd->fdt_blob);
> > > > @@ -167,10 +167,11 @@ void *board_fdt_blob_setup(int *err)
> > > >
> > > >       if (internal_valid) {
> > > >               debug("Using built in FDT\n");
> > > > +             ret = -EEXIST;
> > > >       } else {
> > > >               debug("Using external FDT\n");
> > > >               /* So we can use it before returning */
> > > > -             gd->fdt_blob = fdt;
> > > > +             *fdtp = fdt;
> > > >       }
> > > >
> > > >       /*
> > > > @@ -179,7 +180,7 @@ void *board_fdt_blob_setup(int *err)
> > > >        */
> > > >       qcom_parse_memory();
> > > >
> > > > -     return (void *)gd->fdt_blob;
> > > > +     return ret;
> > > >  }
> > > >
> > > >  void reset_cpu(void)
> > > > diff --git a/arch/arm/mach-stm32mp/boot_params.c b/arch/arm/mach-stm32mp/boot_params.c
> > > > index ebddf6a7dbc..2d058edc419 100644
> > > > --- a/arch/arm/mach-stm32mp/boot_params.c
> > > > +++ b/arch/arm/mach-stm32mp/boot_params.c
> > > > @@ -6,6 +6,7 @@
> > > >  #define LOG_CATEGORY LOGC_ARCH
> > > >
> > > >  #include <config.h>
> > > > +#include <errno.h>
> > > >  #include <log.h>
> > > >  #include <linux/libfdt.h>
> > > >  #include <asm/arch/sys_proto.h>
> > > > @@ -16,20 +17,22 @@
> > > >   * Use the saved FDT address provided by TF-A at boot time (NT_FW_CONFIG =
> > > >   * Non Trusted Firmware configuration file) when the pointer is valid
> > > >   */
> > > > -void *board_fdt_blob_setup(int *err)
> > > > +int board_fdt_blob_setup(void **fdtp)
> > > >  {
> > > >       unsigned long nt_fw_dtb = get_stm32mp_bl2_dtb();
> > > >
> > > >       log_debug("%s: nt_fw_dtb=%lx\n", __func__, nt_fw_dtb);
> > > >
> > > > -     *err = 0;
> > > >       /* use external device tree only if address is valid */
> > > > -     if (nt_fw_dtb >= STM32_DDR_BASE) {
> > > > -             if (fdt_magic(nt_fw_dtb) == FDT_MAGIC)
> > > > -                     return (void *)nt_fw_dtb;
> > > > -             log_debug("%s: DTB not found.\n", __func__);
> > > > +     if (nt_fw_dtb < STM32_DDR_BASE ||
> > > > +         fdt_magic(nt_fw_dtb) != FDT_MAGIC) {
> > > > +             log_debug("DTB not found.\n");
> > > > +             log_debug("fall back to builtin DTB, %p\n", _end);
> > > > +
> > > > +             return -EEXIST;
> > > >       }
> > > > -     log_debug("%s: fall back to builtin DTB, %p\n", __func__, _end);
> > > >
> > > > -     return (void *)_end;
> > > > +     *fdtp = (void *)nt_fw_dtb;
> > > > +
> > > > +     return 0;
> > > >  }
> > >
> > > For mach-stm32mp:
> > > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > >
> > > Thanks
> > >
> >
> > Applied to sjg/master, thanks!
>
> It would be helpful for this to be a pull request from you, vs current
> next. I hadn't applied it to next myself since I assigned it to you in
> patchwork. I can take it to next directly instead if you prefer.

OK, yes, I've assigned it to you. I should probably do that with all
patches I apply, then you decide whether to apply them or not.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
