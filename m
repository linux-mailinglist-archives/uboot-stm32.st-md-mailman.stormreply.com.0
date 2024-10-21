Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D77F9A6F84
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2024 18:33:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E80DC78033;
	Mon, 21 Oct 2024 16:33:14 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A59A2C6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 16:33:07 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso696134366b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 09:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729528387; x=1730133187;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=064QCBu1/ShiL/J+YYmRXBXRxKdwv3ZL17paOMyeo5Q=;
 b=STZRC06m+n378cjudjkQeTE+nVNN47evV5Du5Wen7VAvHy9zZG02qY6YXvQG1jDTtG
 ERhNki+sFZc/bi1Q/Jkp6JilQfQZnujcNQHcPgpHfD+Dz8z0IbVTK+BJTd3H/sf2sx9w
 sXG/8TQz9txJvQdxz/yhXoDDG9M/a14jzeIF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729528387; x=1730133187;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=064QCBu1/ShiL/J+YYmRXBXRxKdwv3ZL17paOMyeo5Q=;
 b=VDe0+91SI5rpE76MyzF8lFY23YOwi3WcIhAKNkCMBoPuIUQOE4Z5SAo2OAbikSSo4J
 Vk2BiTmtUrLZL/cBKjBEXgro3H61ANOQ5Uosbadg6n9bvw+D2m3whLutJXWQt55od0cn
 z3NSxw5Q47E8n1e3CbbRliSwl9oQKp/gPnRfYZWaSGJnhWXKit/8Uif9BIQX7wnZAKjU
 HtFeuJxoWBc6WnNnKFmB+RSQMjT13XYjSkHjiywkobUN36qaHDWFk8vDZ/aaKZhaJYHs
 c6VMOvQVGqXbCgEfX9m/Q9+/1mxtRQxar/yBJbzCm/RPEclas9WhQWRZbVKgYNMRiBW1
 sgPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+feCiuXU1/qi8dIB0l86YC7Mkg/K40AWNYzDszh78/COyv3nBkgB5Tgmz1QUKRJ4GoQh6cHTl+KwSvQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzzGNt1HyaEj//2M3eX/NIz4yffTREp6psTpskl8o1fKpwpbOKM
 T4d7/SsdHmqPZaTHii2fFd+aizZ0/OOpbb/xLNy/68PvVM82yHSlEisSur2DU6rNAsV2aJwMgYj
 orj5oTL0QL2TVOw59rspcGZ10hFRR3qBELQ8l
X-Google-Smtp-Source: AGHT+IEQ54a+63hTpKSWV9lRii9Hw3TWdwfJ/can+lgau1uE5Ew2vI1+yNEBxq/vhqFzkp7LKzSaNeZafG38SoWGi3A=
X-Received: by 2002:a17:907:6d0b:b0:a9a:e2b:1711 with SMTP id
 a640c23a62f3a-a9a694cbcb3mr1183189666b.0.1729528386965; Mon, 21 Oct 2024
 09:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241021114247.349863-1-sjg@chromium.org>
 <20241021114247.349863-2-sjg@chromium.org>
 <4b6297f7-4433-46c3-8661-4f68d7320c7f@linaro.org>
In-Reply-To: <4b6297f7-4433-46c3-8661-4f68d7320c7f@linaro.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Oct 2024 18:32:55 +0200
Message-ID: <CAFLszTg2zJ7ozumU+00824raKZZEN23cKmKbTiqu9wvprr6FoQ@mail.gmail.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: David Feng <fenghua@phytium.com.cn>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Rick Chen <rick@andestech.com>,
 H Bell <dmoo_dv@protonmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Peng Fan <peng.fan@nxp.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Janne Grunau <j@jannau.net>, Marek Vasut <marex@denx.de>,
 Randolph <randolph@andestech.com>, Mark Kettenis <kettenis@openbsd.org>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, E Shattow <lucent@gmail.com>,
 Jerry Van Baren <vanbaren@cideas.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Andre Przywara <andre.przywara@arm.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Day <me@samcday.com>,
 William Zhang <william.zhang@broadcom.com>, Sumit Garg <sumit.garg@linaro.org>,
 Francois Berder <fberder@outlook.fr>, Tim Harvey <tharvey@gateworks.com>,
 u-boot-qcom@groups.io, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Green Wan <green.wan@sifive.com>, Minda Chen <minda.chen@starfivetech.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Atish Patra <atishp@atishpatra.org>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Michal Simek <michal.simek@amd.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Raymond Mao <raymond.mao@linaro.org>, Matthias Brugger <mbrugger@suse.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Eric Curtin <ecurtin@redhat.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Bin Meng <bmeng.cn@gmail.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] fdt: Swap the signature for
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

Hi Caleb,

On Mon, 21 Oct 2024 at 15:28, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
> Hi Simon,
>
> On 21/10/2024 13:42, Simon Glass wrote:
> > This returns a devicetree and updates a parameter with an error code.
> > Swap it, since this fits better with the way U-Boot normally works. It
> > also (more easily) allows leaving the existing pointer unchanged.
> >
> > No yaks were harmed in this change, but there is a very small code-size
> > reduction.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
>
> ...
>
> > diff --git a/arch/arm/mach-snapdragon/board.c b/arch/arm/mach-snapdragon/board.c
> > index 2ab2ceb5138..7a7a36831c3 100644
> > --- a/arch/arm/mach-snapdragon/board.c
> > +++ b/arch/arm/mach-snapdragon/board.c
> > @@ -147,12 +147,11 @@ static void show_psci_version(void)
> >    * or for supporting quirky devices where it's easier to leave the downstream DT in place
> >    * to improve ABL compatibility. Otherwise, we use the DT provided by ABL.
> >    */
> > -void *board_fdt_blob_setup(int *err)
> > +int board_fdt_blob_setup(void **fdtp)
> >   {
> >       struct fdt_header *fdt;
> >       bool internal_valid, external_valid;
> >
> > -     *err = 0;
> >       fdt = (struct fdt_header *)get_prev_bl_fdt_addr();
> >       external_valid = fdt && !fdt_check_header(fdt);
> >       internal_valid = !fdt_check_header(gd->fdt_blob);
> > @@ -170,7 +169,7 @@ void *board_fdt_blob_setup(int *err)
> >       } else {
> >               debug("Using external FDT\n");
> >               /* So we can use it before returning */
> > -             gd->fdt_blob = fdt;
> > +             *fdtp = fdt;
>
> I believe this is a breaking change. The qcom_parse_memory() call below
> expects gd->fdt_blob to point to the in-use FDT. This is a bit of a
> hack, but doing memory parsing this early simplifies things for us.
>
> Additionally, this change doesn't make the function return -EEXIST when
> it should.

Hmm, OK, thanks. I wonder if there is another place where the memory
can be parsed, rather than as a side-effect of this call. I will
update this patch and try again.

>
> ...
>
> > diff --git a/include/fdtdec.h b/include/fdtdec.h
> > index 555c9520379..9e36acc7e9b 100644
> > --- a/include/fdtdec.h
> > +++ b/include/fdtdec.h
> > @@ -1191,11 +1191,13 @@ int fdtdec_resetup(int *rescan);
> >    *
> >    * The existing devicetree is available at gd->fdt_blob
> >    *
> > - * @err: 0 on success, -EEXIST if the devicetree is already correct, or other
> > + * @fdtp: Existing devicetree blob pointer; update this and return 0 if a
>
> It doesn't looks like this is initialised before calling
> board_fdt_blob_setup()?
>
> Kind regards,
> > + * different devicetree should be used
> > + * Return: 0 on success, -EEXIST if the devicetree is already correct, 0 to use
> > + * *@fdtp as the new devicetree, or other
> >    * internal error code if we fail to setup a DTB
> > - * @returns new devicetree blob pointer
> >    */
> > -void *board_fdt_blob_setup(int *err);
> > +int board_fdt_blob_setup(void **fdtp);
> >
> >   /*
> >    * Decode the size of memory
> > diff --git a/lib/fdtdec.c b/lib/fdtdec.c
> > index 60e28173c03..e876b17f9ad 100644
> > --- a/lib/fdtdec.c
> > +++ b/lib/fdtdec.c
> > @@ -1706,11 +1706,16 @@ int fdtdec_setup(void)
> >
> >       /* Allow the board to override the fdt address. */
> >       if (IS_ENABLED(CONFIG_OF_BOARD)) {
> > -             gd->fdt_blob = board_fdt_blob_setup(&ret);
> > -             if (!ret)
> > +             void *blob;
> > +
> > +             ret = board_fdt_blob_setup(&blob);
> > +             if (ret) {
> > +                     if (ret != -EEXIST)
> > +                             return ret;
> > +             } else {
> >                       gd->fdt_src = FDTSRC_BOARD;
> > -             else if (ret != -EEXIST)
> > -                     return ret;
> > +                     gd->fdt_blob = blob;
> > +             }
> >       }
> >
> >       /* Allow the early environment to override the fdt address */
>
> --
> // Caleb (they/them)
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
