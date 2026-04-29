Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD6kIRnN8WlckgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 11:19:21 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BCE491BD6
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 11:19:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30F50C87EDB;
	Wed, 29 Apr 2026 09:19:20 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0A16C58D7A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 09:19:18 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-7982c3b7dfcso120291057b3.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 02:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777454358; cv=none;
 d=google.com; s=arc-20240605;
 b=DZpn9KRjLtglbiOr1BKEfCkj60NPmgvIfupmhmzNP2RkJD/Q3wRtYivuTt5Pcn77cB
 3WBZHBaf0DWRkvV73wGmf3NL+XrvyijRtb4cT7PJ26tLeVVBv0aprjP+3XNgf6K/04Je
 jTsNCYqOVFagSmOmLqAn6tAvh868D5p888ZHtjGrgvAy4txaUaERrL5LUAlu7UgXRiYM
 ti6EFysY9A1heZjMDF+XqgdXDf4rSKgiwVvIq+TsL1PjFNv6UpM0hf3z8smPiPlaNA8C
 8YbJqJgJDSrrW/gO7j6idlkA+U3QyBEscUD8abm/l8vK9X1+R9vLcCe9F4y8/9kOJoJR
 /qlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FkAqQQ4dNMdpquLntpxzeb2eFOggpHlVY0F0S1HWNFg=;
 fh=s5f4rCXhydFfiwNZw+qt5uB0TlWUsvOnnqAGCqvoKWo=;
 b=Fs2BmpbYXMtqmNFk/D4YGI1PcWAfpXez3PBbU8fP1yGkNzzNmJtXjGRp/7Ne7GaS2l
 0x2sy8+RfyJkjrT3BLCd5rW8gZVXWzS/Po3lDST+czwxKqHGcxT/+ZZddJHlegyG5bIH
 JHv3L2/c11hweU0vEjZLumLmh5Vf7QWF1f5GnFtRkvlc9R/CbiRtX1xP/7Sqkrf84qEJ
 fhmONAXeLiWI0ig+MtXsyHBGF+BkFRGmFohBRG4zT6Pl7yr+kRDT8XAnzicL3ggrte+2
 2vyUOKQgnbTrpyJNSgjCt7k5iKkCMOttLlZ04NungkV0RbdiiEWrHM9oXd6CassTOec1
 DOKg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1777454358; x=1778059158;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FkAqQQ4dNMdpquLntpxzeb2eFOggpHlVY0F0S1HWNFg=;
 b=hdMEeZ2EaiTotVOSqGNW6no4FNoJIfq3QLhu/JR0uNfgkA4f0y8BQvUPdT7w+WxlIO
 nv4NbVIJN1ujdGfPwNy8mK7mPq9PP4guNAPVRk5m+/umYJSI1diwjd94ABNUvJ21fnyY
 RUlBgQHbVi63nSBmFzkh4HVGxGeLD0crSoOsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777454358; x=1778059158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FkAqQQ4dNMdpquLntpxzeb2eFOggpHlVY0F0S1HWNFg=;
 b=OEgWbe/2YxmC9nVG3NnoO09oVVDnivr7m/ekJi6S79npLuO1tHHkMnmfLaw5uOacCM
 sKGgw0SXFxu8raRbTNsK40xedDJDF4YV4X6Se1a2Zffaf2/vtlddjqXPUwFpYMJVdX1b
 Anr7yvNSPobjRv/yry8JjYrPX88h2EYfj0nbqnlohDRFxTFmKymWqRzNBmSyTLsbIb9l
 P9SZPA5iU/NtJxcvnRUxApIWAsxcm/uLyZyqb6YInGNVG9xH+reBtAy3dm5oRoWKI5PX
 HkmjZQWSW34CxuUUk8TJzkh6p+wnmREsK/3yJ2W0kkHzthJd3nYfv8StRqkghkAmep5/
 +K9A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/5HMVyml9rGMGHMuVBJyw1RxQ1hWi7pIILVxPELrSFFEMBuuj+sdc811X10nhuJXAMqSxZzLqG+slXVA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwxGU6N0ylb132t1LuU7vZOwiwnIn6iSSgZRBF112n5R0emEJxM
 bMV+A2fSRtrTeCeOgS3ELukSr25S7N5e4RrSVIXIiVx2unj8ax/jbhbBfvdfOcFIyXSUhsi3xr2
 C29nHRkQ5N7fgBEO372UChFQWi4BRO/lv0Cl1xNkupA==
X-Gm-Gg: AeBDietESmIytxERm7Zaonqhk06xiHgKe3+dNfDQYNhB+dMKeiP/vDeoD5pgmWmiBPa
 Y8NlngRMa0JCAvqgKNgo6VYYirUxvMMVehJZYSa7/IHKZbQojG8e9Wpxr6ehigdOqaGqpZek5D5
 YW11TPqXL3qhsnOeqSK0Oz3aKwIxkHiHT297HnLw3HGfDikMG7BaqhjYa25lZvTpw+v/GU9/QCZ
 53uT6BPhUK//pz+6ojp5EijRNTwYu4ZXUwvlXyRiyk0eHW4xZzbrC6d82T9b7g7nu/FDEU8rIKf
 HsqPFF3+s5HpPSHN5wrEYOcVzEbom/CXfZSCSkP6IW7voc38
X-Received: by 2002:a05:690c:a01c:b0:7b1:3579:2efd with SMTP id
 00721157ae682-7bcf5595d17mr51824247b3.39.1777454357656; Wed, 29 Apr 2026
 02:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260426154724.2042569-1-dario.binacchi@amarulasolutions.com>
 <825d39e8-286d-4f83-a23e-0b798b1c9631@foss.st.com>
In-Reply-To: <825d39e8-286d-4f83-a23e-0b798b1c9631@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 29 Apr 2026 11:19:06 +0200
X-Gm-Features: AVHnY4KAoqWGSWmMvqSskD6Cv_jVD_SJ9R-AB5SJeQ1qNllx7Iotv9VO2DIPXsM
Message-ID: <CABGWkvoJPMzHsh-_bZaVCMt3va5TpaWwK2e=yS7Nw0pcTrde+w@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Rasmus Villemoes <ravi@prevas.dk>, Jonathan GUILLOT <jonathan@joggee.fr>,
 Michal Simek <michal.simek@amd.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 linux-amarula@amarulasolutions.com, Sughosh Ganu <sughosh.ganu@arm.com>
Subject: Re: [Uboot-stm32] [PATCH v7 0/8] Support metadata-driven A/B boot
	for STM32MP25
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
Content-Type: multipart/mixed; boundary="===============1102910036183887154=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 19BCE491BD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:vincent.stehle@arm.com,m:mkorpershoek@kernel.org,m:quentin.schulz@cherry.de,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:jerome.forissier@arm.com,m:xypron.glpk@gmx.de,m:javierm@redhat.com,m:marek.vasut+renesas@mailbox.org,m:ravi@prevas.dk,m:jonathan@joggee.fr,m:michal.simek@amd.com,m:dinesh.maniyam@altera.com,m:kory.maincent@bootlin.com,m:sjg@chromium.org,m:ilias.apalodimas@linaro.org,m:padmarao.begari@amd.com,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:linux-amarula@amarulasolutions.com,m:sughosh.ganu@arm.com,m:marek.vasut@mailbox.org,m:bmengcn@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,cherry.de,lists.denx.de,st-md-mailman.stormreply.com,konsulko.com,gmx.de,redhat.com,mailbox.org,prevas.dk,joggee.fr,amd.com,altera.com,bootlin.com,chromium.org,linaro.org,foss.st.com,gmail.com,amarulasolutions.com];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.975];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,st-md-mailman.stormreply.com:rdns,mail.gmail.com:mid]

--===============1102910036183887154==
Content-Type: multipart/alternative; boundary="00000000000097c404065095d758"

--00000000000097c404065095d758
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Patrice,

Sorry, but I can't log in. My Custodian account has expired, and that might
be the reason. I need to ask Tom Rini to reactivate it.
In the meantime, can you please give me some information about the error?

Thanks and regards,
Dario

On Wed, Apr 29, 2026 at 11:14=E2=80=AFAM Patrice CHOTARD <
patrice.chotard@foss.st.com> wrote:

>
>
> On 4/26/26 17:46, Dario Binacchi wrote:
> > This series, the mainline version of [1], provides the necessary change=
s
> > in U-Boot to support the metadata-driven A/B update flow for STM32MP25
> > boards. It implements the logic required to dynamically select the boot
> > bank based on FWU metadata.
> >
> > These changes are designed to be backward compatible while providing
> > the necessary infrastructure for the A/B scheme.
> >
> > The series has been tested on the STM32MP257F-EV1 board.
> >
> > Additionally, some patches in the series propose changes with
> > general-purpose utility:
> >
> >  1/7 lib: uuid: add partition type GUID for extended bootloader
> >  4/7 cmd: part: support lookup by UUID in 'part number'
> >  6/7 fwu: add helper to get image GUID by type and bank index
> >
> > [1] https://github.com/STMicroelectronics/u-boot/pull/6
> >
> > Changes in v7:
> > - Add Reviewed-by of Simon Glass for patc 7/8 of "test: dm:
> >   fwu_mdata: add test for fwu_mdata_get_image_guid".
> >
> > Changes in v6:
> > - Add Reviewed-by of Simon Glass to patch 3/8 "test: cmd: add unit
> >   tests for part command"
> >
> > Changes in v5:
> > - Update doc/usage/cmd/part.rst to reflect the changes related to the
> >   part command.
> > - Add Acked-by of Ilias Apalodimas to patch 6/8 "fwu: add helper to get
> >   image GUID by type and bank index"
> >
> > Changes in v4:
> > - Place the part command tests in the cmd suite rather than the dm
> >   suite.
> > - Order the include files according the U-Boot coding style.
> > - Add patch 7/8 test: dm: fwu_mdata: add test for
> fwu_mdata_get_image_guid
> >
> > Changes in v3:
> > - Wrap lines exceeding 80 columns in test/cmd/part.c file.
> > - Combine run_command() and ut_asserteq() -> ut_asserteq(1, run_command=
(
> > - Add kerneldoc comment for fwu_mdata_get_image_guid() above its
> declaration
> >   in fwu.h.
> > - Add log_warning() messages to fwu_platform_hook() to catch inconsiste=
nt
> >   FWU metadata (boot GUID found but root GUID missing or viceversa), as
> >   suggested by Simon Glass.
> >
> > Changes in v2:
> > - Add links to the XBOOTLDR specification in the commit message of patc=
h
> >    1/7 lib: uuid: add partition type GUID for extended bootloader.
> > - Update help for 'part start', 'part size' to mention UUID.
> > - Add kerneldoc comment for fwu_mdata_get_image_guid().
> > - Pass efi_guid_t by pointer in fwu_mdata_get_image_guid().
> > - Add patches:
> >    5/7 test: cmd: part: add UUID lookup tests
> >    3/7 test: cmd: add unit tests for part command
> >    2/7 test: dm: part: add test for part_get_info_by_uuid
> >
> > Dario Binacchi (8):
> >   lib: uuid: add partition type GUID for extended bootloader
> >   test: dm: part: add test for part_get_info_by_uuid
> >   test: cmd: add unit tests for part command
> >   cmd: part: support lookup by UUID
> >   test: cmd: part: add UUID lookup tests
> >   fwu: add helper to get image GUID by type and bank index
> >   test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid
> >   board: st: stm32mp25: support dynamic A/B bank bootup
> >
> >  board/st/stm32mp2/stm32mp2.c          |  32 ++++
> >  cmd/part.c                            |  12 +-
> >  doc/README.gpt                        |   2 +
> >  doc/usage/cmd/part.rst                |   6 +-
> >  include/configs/stm32mp25_st_common.h |  15 ++
> >  include/fwu.h                         |  11 ++
> >  include/part_efi.h                    |   3 +
> >  lib/fwu_updates/fwu.c                 |  33 ++++
> >  lib/uuid.c                            |   1 +
> >  test/cmd/Makefile                     |   1 +
> >  test/cmd/part.c                       | 209 ++++++++++++++++++++++++++
> >  test/dm/fwu_mdata.c                   |  48 ++++++
> >  test/dm/part.c                        |  53 +++++++
> >  13 files changed, 419 insertions(+), 7 deletions(-)
> >  create mode 100644 test/cmd/part.c
> >
>
>
>
> Hi Dario
>
> I am preparing a pull request for STM32 including this series.
> Unfortunately, there is an error linked to tests test/cmd/part.c
>
> You can use my temporary pull request tag u-boot-stm32-20260429
>
> You will find the error logs here encountered with qemu test :
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/29932
>
> Thanks
> Patrice
>
>

--=20
*Dario Binacchi*
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

--00000000000097c404065095d758
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Patrice,<br><br></div><div dir=3D"l=
tr">Sorry, but I can&#39;t log in. My Custodian account has expired, and th=
at might be the reason. I need to ask Tom Rini to reactivate it. <br>In the=
 meantime, can you please give me some information about the error?</div><b=
r>Thanks and regards,<br>Dario<div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 29, 2026 at =
11:14=E2=80=AFAM Patrice CHOTARD &lt;<a href=3D"mailto:patrice.chotard@foss=
.st.com">patrice.chotard@foss.st.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br>
<br>
On 4/26/26 17:46, Dario Binacchi wrote:<br>
&gt; This series, the mainline version of [1], provides the necessary chang=
es<br>
&gt; in U-Boot to support the metadata-driven A/B update flow for STM32MP25=
<br>
&gt; boards. It implements the logic required to dynamically select the boo=
t<br>
&gt; bank based on FWU metadata.<br>
&gt; <br>
&gt; These changes are designed to be backward compatible while providing<b=
r>
&gt; the necessary infrastructure for the A/B scheme.<br>
&gt; <br>
&gt; The series has been tested on the STM32MP257F-EV1 board.<br>
&gt; <br>
&gt; Additionally, some patches in the series propose changes with<br>
&gt; general-purpose utility:<br>
&gt; <br>
&gt;=C2=A0 1/7 lib: uuid: add partition type GUID for extended bootloader<b=
r>
&gt;=C2=A0 4/7 cmd: part: support lookup by UUID in &#39;part number&#39;<b=
r>
&gt;=C2=A0 6/7 fwu: add helper to get image GUID by type and bank index<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/STMicroelectronics/u-boot/pull/6" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/STMicroelectronics/u-=
boot/pull/6</a><br>
&gt; <br>
&gt; Changes in v7:<br>
&gt; - Add Reviewed-by of Simon Glass for patc 7/8 of &quot;test: dm:<br>
&gt;=C2=A0 =C2=A0fwu_mdata: add test for fwu_mdata_get_image_guid&quot;.<br=
>
&gt; <br>
&gt; Changes in v6:<br>
&gt; - Add Reviewed-by of Simon Glass to patch 3/8 &quot;test: cmd: add uni=
t<br>
&gt;=C2=A0 =C2=A0tests for part command&quot;<br>
&gt; <br>
&gt; Changes in v5:<br>
&gt; - Update doc/usage/cmd/part.rst to reflect the changes related to the<=
br>
&gt;=C2=A0 =C2=A0part command.<br>
&gt; - Add Acked-by of Ilias Apalodimas to patch 6/8 &quot;fwu: add helper =
to get<br>
&gt;=C2=A0 =C2=A0image GUID by type and bank index&quot;<br>
&gt; <br>
&gt; Changes in v4:<br>
&gt; - Place the part command tests in the cmd suite rather than the dm<br>
&gt;=C2=A0 =C2=A0suite.<br>
&gt; - Order the include files according the U-Boot coding style.<br>
&gt; - Add patch 7/8 test: dm: fwu_mdata: add test for fwu_mdata_get_image_=
guid<br>
&gt; <br>
&gt; Changes in v3:<br>
&gt; - Wrap lines exceeding 80 columns in test/cmd/part.c file.<br>
&gt; - Combine run_command() and ut_asserteq() -&gt; ut_asserteq(1, run_com=
mand(<br>
&gt; - Add kerneldoc comment for fwu_mdata_get_image_guid() above its decla=
ration<br>
&gt;=C2=A0 =C2=A0in fwu.h.<br>
&gt; - Add log_warning() messages to fwu_platform_hook() to catch inconsist=
ent<br>
&gt;=C2=A0 =C2=A0FWU metadata (boot GUID found but root GUID missing or vic=
eversa), as<br>
&gt;=C2=A0 =C2=A0suggested by Simon Glass.<br>
&gt; <br>
&gt; Changes in v2:<br>
&gt; - Add links to the XBOOTLDR specification in the commit message of pat=
ch<br>
&gt;=C2=A0 =C2=A0 1/7 lib: uuid: add partition type GUID for extended bootl=
oader.<br>
&gt; - Update help for &#39;part start&#39;, &#39;part size&#39; to mention=
 UUID.<br>
&gt; - Add kerneldoc comment for fwu_mdata_get_image_guid().<br>
&gt; - Pass efi_guid_t by pointer in fwu_mdata_get_image_guid().<br>
&gt; - Add patches:<br>
&gt;=C2=A0 =C2=A0 5/7 test: cmd: part: add UUID lookup tests<br>
&gt;=C2=A0 =C2=A0 3/7 test: cmd: add unit tests for part command<br>
&gt;=C2=A0 =C2=A0 2/7 test: dm: part: add test for part_get_info_by_uuid<br=
>
&gt; <br>
&gt; Dario Binacchi (8):<br>
&gt;=C2=A0 =C2=A0lib: uuid: add partition type GUID for extended bootloader=
<br>
&gt;=C2=A0 =C2=A0test: dm: part: add test for part_get_info_by_uuid<br>
&gt;=C2=A0 =C2=A0test: cmd: add unit tests for part command<br>
&gt;=C2=A0 =C2=A0cmd: part: support lookup by UUID<br>
&gt;=C2=A0 =C2=A0test: cmd: part: add UUID lookup tests<br>
&gt;=C2=A0 =C2=A0fwu: add helper to get image GUID by type and bank index<b=
r>
&gt;=C2=A0 =C2=A0test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid=
<br>
&gt;=C2=A0 =C2=A0board: st: stm32mp25: support dynamic A/B bank bootup<br>
&gt; <br>
&gt;=C2=A0 board/st/stm32mp2/stm32mp2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 32 ++++<br>
&gt;=C2=A0 cmd/part.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt;=C2=A0 doc/README.gpt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 doc/usage/cmd/part.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 include/configs/stm32mp25_st_common.h |=C2=A0 15 ++<br>
&gt;=C2=A0 include/fwu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 ++<br>
&gt;=C2=A0 include/part_efi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 lib/fwu_updates/fwu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 33 ++++<br>
&gt;=C2=A0 lib/uuid.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 test/cmd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 test/cmd/part.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 209 ++++++++++++++++++++++++++<br>
&gt;=C2=A0 test/dm/fwu_mdata.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 48 ++++++<br>
&gt;=C2=A0 test/dm/part.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 53 +++++++<br>
&gt;=C2=A0 13 files changed, 419 insertions(+), 7 deletions(-)<br>
&gt;=C2=A0 create mode 100644 test/cmd/part.c<br>
&gt; <br>
<br>
<br>
<br>
Hi Dario<br>
<br>
I am preparing a pull request for STM32 including this series.<br>
Unfortunately, there is an error linked to tests test/cmd/part.c <br>
<br>
You can use my temporary pull request tag u-boot-stm32-20260429<br>
<br>
You will find the error logs here encountered with qemu test : <a href=3D"h=
ttps://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/29932" rel=
=3D"noreferrer" target=3D"_blank">https://source.denx.de/u-boot/custodians/=
u-boot-stm/-/pipelines/29932</a><br>
<br>
Thanks<br>
Patrice<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><font color=3D"#888888"><font color=3D"#000000" =
face=3D"Times New Roman"><span style=3D"font-size:14px"><b>Dario Binacchi</=
b></span></font><br style=3D"color:rgb(0,0,0);font-family:&quot;Times New R=
oman&quot;;font-size:medium"><span style=3D"color:rgb(0,0,0);font-family:&q=
uot;Times New Roman&quot;;font-size:12px">Senior Embedded Software Engineer=
<br></span></font><span style=3D"color:rgb(0,0,0);font-family:&quot;Times N=
ew Roman&quot;;font-size:12px">M. +39 328 0625246</span><font color=3D"#888=
888"><span style=3D"color:rgb(0,0,0);font-family:&quot;Times New Roman&quot=
;;font-size:12px"><br><a href=3D"mailto:dario.binacchi@amarulasolutions.com=
" style=3D"color:rgb(17,85,204)" target=3D"_blank">dario.binacchi@amarulaso=
lutions.com</a></span><br style=3D"color:rgb(0,0,0);font-family:&quot;Times=
 New Roman&quot;;font-size:medium"><span style=3D"font-family:&quot;Times N=
ew Roman&quot;;font-size:12px;color:rgb(241,194,50)">=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95</span><br style=3D"color:rgb(0,0,0)=
;font-family:&quot;Times New Roman&quot;;font-size:medium"><span style=3D"c=
olor:rgb(0,0,0);font-family:&quot;Times New Roman&quot;;font-size:12px"><sp=
an style=3D"font-weight:700">Amarula Solutions SRL</span><br>=C2=A0Via Feli=
ce Cavallotti 25D, 41012 Carpi, MO, IT<br><a href=3D"mailto:info@amarulasol=
utions.com" style=3D"color:rgb(17,85,204)" target=3D"_blank">info@amarulaso=
lutions.com</a><br><a href=3D"http://www.amarulasolutions.com/" style=3D"co=
lor:rgb(17,85,204)" target=3D"_blank">www.amarulasolutions.com</a></span></=
font></div></div></div></div>

--00000000000097c404065095d758--

--===============1102910036183887154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1102910036183887154==--
