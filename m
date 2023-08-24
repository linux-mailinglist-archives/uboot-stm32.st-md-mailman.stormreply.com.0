Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8307871EE
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 16:41:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9C77C6B44F;
	Thu, 24 Aug 2023 14:41:36 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E127EC6B454
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 14:41:34 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-52683b68c2fso8607512a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692888094; x=1693492894;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QmASuGLsFXPZGYQTVN/ZvkeattiPcp0s5R3XOCfrqCw=;
 b=g+EFOOV+7qlp6m3fXwRhIVnb9i9mxFBED7C7aZm+YF8q33ft1NnDsR3EGITlLw4Wu5
 Ny04lgxY8V5lx2Y+yT8jFr610gAtgQWfa5c+uLmkMcIkoSd6WV5mLAVXdz8uZmM/KOWH
 xBPweCzpVtCaNVuUHjS5UjSYbkR9qGso1ba9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692888094; x=1693492894;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QmASuGLsFXPZGYQTVN/ZvkeattiPcp0s5R3XOCfrqCw=;
 b=RC9kal6AoRtHpbsZ98BukfLxiGjg293sGB5RvVbT2LDuwL06rIf1LnWt8Y+AoigoAt
 kXIQ2Va7Q/GWFlIqFd2NOTF2VyCHHp/tyrUKuiG4alX5r6PQhD8I33OBsfGPS3Mtbvuu
 53Dhe/rOKie8HJ6ra9a+sJsNlA2cHD044UAKdXJwXH531l4aXXsWfZQCvKOsXTmKs3S9
 CkUMqvVsEPuiY5eBwDO4SrquA3O+yPwZpY69QX+WXPsOZ1lkpUy8afkGWS4Or9uw0o82
 jssu3Mg9XsZ8kYdhiBTsuWxfsZ70u2rNtOZKY1Om2kwop4LRNhrrtp43hIilu5RCYAK8
 V0EA==
X-Gm-Message-State: AOJu0Yx9yLxu0uFO8u7nmbBLzrEp1W0UKTlP+q6I6fdtJ7TqxtvqhcS1
 01SS8J6SND4eKh+oNwkRjZRNDBqNDr7KjzQHDZXZFw==
X-Google-Smtp-Source: AGHT+IGKO7oElkao32t6ejJDI9IY552stF77URpGFQm6fkzYN8+qdr3VKQZDOsZqFRPSsY8QRPd3zPAoFlGaEZdeiVE=
X-Received: by 2002:aa7:c648:0:b0:525:7e46:940 with SMTP id
 z8-20020aa7c648000000b005257e460940mr13477843edr.24.1692888094318; Thu, 24
 Aug 2023 07:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230824030304.1555547-1-sjg@chromium.org>
 <20230824133814.GH3953269@bill-the-cat>
In-Reply-To: <20230824133814.GH3953269@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 24 Aug 2023 08:41:21 -0600
Message-ID: <CAPnjgZ1oY9SRWNj9RUe2L8=1ndE2LfxkmqqEj-MNtxL_ff-QyQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neha Malcom Francis <n-francis@ti.com>,
 Vikas Manocha <vikas.manocha@st.com>, Michael Walle <michael@walle.cc>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 uboot-stm32@st-md-mailman.stormreply.com, Ivan Mikhaylov <fr0st61te@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] Attempt to enforce standard
	extensions for build output
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

On Thu, 24 Aug 2023 at 07:38, Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Aug 23, 2023 at 09:02:53PM -0600, Simon Glass wrote:
>
> > In this early stage of using binman to produce output files, we are mostly
> > seeing people using common extensions such as '.bin' and '.rom'
> >
> > But unusual extensions appear in some places.
> >
> > We would like 'buildman -k' to keep the build outputs, but this is hard if
> > there is no consistency as to the extension used.
> >
> > This series adjusts binman to enforce just 4 extensions for output images:
> >
> >    .bin
> >    .rom
> >    .itb
> >    .img
> >
> > Other extensions will produce an error. With this rule observed, buildman
> > can keep the required files.
> >
> > Some patches are included to fix up some easy problems. But the following
> > boards generate 'custMpk.pem' and it is not clear how to fix this, so I am
> > asking for help from the maintainers:
> >
> >    am62ax_evm_r5 am62x_evm_r5 am64x_evm_r5 am65x_evm_r5
> >    am65x_evm_r5_usbdfu am65x_evm_r5_usbmsc am65x_hs_evm_r5
> >    j7200_evm_r5 j721e_evm_r5 j721s2_evm_r5 verdin-am62_r5
> >    am62ax_evm_a53 am62x_evm_a53 am64x_evm_a53 am65x_evm_a53
> >    am65x_hs_evm_a53 j7200_evm_a72 j721e_evm_a72 j721s2_evm_a72
> >    verdin-am62_a53
> >
> > It looks like the .pem files are listed as top-level images, e.g.:
> >
> >    &custmpk_pem {
> >       filename = "../../ti/keys/custMpk.pem";
> >    };
> >
> > but if the only objective is to pick up an existing file, it is better to
> > set BINMAN_INDIRS to include that directory. Also we should only have
> > simple leafnames in the 'filename' property, so the '../../ti/keys' is not
> > correct. It makes it harder for people to get the files from other places.
> > Making this easier is one of binman's goals.
> >
> > Most likely the custmpk_pem node can be removed and the .pem file can be
> > included directly in the place that needs it, e.g. by adjusting the
> > ti-secure-rom etype (or ex509_cert) to use tools.get_input_filename() when
> > reading the key file.
> >
> > For example, this:
> >
> >    custMpk {
> >       filename = "custMpk.pem";
> >       custmpk_pem: blob-ext {
> >          filename = "../keys/custMpk.pem";
> >       };
> >    };
> >
> > is really just copying a file from '../keys/custMpk.pem' to 'custMpk.pem'
> > so is equivalent to:
> >
> >    custMpk {
> >       type = "blob";
> >       filename = "custMpk.pem";
> >    }
> >
> > (note that blob-ext implies that the blob may be missing, so blob is a
> > better choice, since the key cannot be missing)
> >
> > The fact that the .pem files are at the top level means that they are
> > output images, which surely is not intended. They should be buried in the
> > image description, at a lower level, as part of something else.
> >
> > So please take a loke at the above and see if the binman descriptions can
> > be reworked slightly to follow these new rules.
> >
> >
> > Simon Glass (6):
> >   binman: Require image filenames to have certain extensions
> >   buildman: Keep all permitted output files
> >   buildman: Show progress when regenerating the board.cfg file
> >   buildman: Start the clock when the build starts
> >   kontron_sl28: Use u-boot-update.bin instead of u-boot.update
> >   stm32mp15: Use u-boot-spl-stm32.bin instead of u-boot-spl.stm32
> >
> >  .../dts/fsl-ls1028a-kontron-sl28-u-boot.dtsi   |  2 +-
> >  arch/arm/dts/stm32mp15-u-boot.dtsi             |  2 +-
> >  doc/board/kontron/sl28.rst                     |  4 ++--
> >  doc/board/st/stm32mp1.rst                      | 18 +++++++++---------
> >  include/configs/stm32mp15_dh_dhsom.h           |  2 +-
> >  tools/binman/binman.rst                        |  5 +++++
> >  tools/binman/etype/section.py                  |  3 +--
> >  tools/binman/ftest.py                          | 12 ++++++++++--
> >  tools/binman/image.py                          |  9 +++++++++
> >  tools/binman/test/022_image_name.dts           |  4 ++--
> >  tools/binman/test/311_bad_image_name.dts       | 17 +++++++++++++++++
> >  tools/buildman/boards.py                       | 15 ++++++++++++---
> >  tools/buildman/builder.py                      |  3 ++-
> >  tools/buildman/builderthread.py                | 11 +++++++----
> >  tools/buildman/control.py                      |  3 ++-
> >  15 files changed, 81 insertions(+), 29 deletions(-)
> >  create mode 100644 tools/binman/test/311_bad_image_name.dts
>
> This doesn't seem to address the ones I pointed out on IRC as being the
> first order (to me anyhow) problem of needing the _unsigned files on the
> platforms you list above for PEM files.

I think it should be xxx-unsigned.bin instead of xxx.bin_unsigned

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
