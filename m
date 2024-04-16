Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0A8A7157
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Apr 2024 18:28:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF15EC6B45B;
	Tue, 16 Apr 2024 16:28:17 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F191C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 16:28:16 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6962950c6bfso35269366d6.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 09:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1713284895; x=1713889695;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FqcHMg+io5TRH47p0UVmvNME9n6tMmHq8yiZwGXoRr0=;
 b=dCFwastBVAxelgaMuQ0dvV6UqM7Zvo/NcV/9kkLoxne1j0ncyyRkqaFHWDjWmp/3Kr
 JvSiUDgMdZgGIQlO70E5ZFRf4UBeOqud1N+ojJ9jlki4sDOIVEOK0kS+xN4yXu2OpPii
 XeXnOdX+NzNuHvEhjCQOaCP+0Gee4fNeW/W5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713284895; x=1713889695;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FqcHMg+io5TRH47p0UVmvNME9n6tMmHq8yiZwGXoRr0=;
 b=Odjvdg6DFrbanLp335rLAU7KV8HSgKDWh6FXqagkMTDJuYgOFadX+Ea4MxTwX/OqQM
 hcFuLq7hVIEmVjBAenQqqM6Qs4peW6kGcscohJhWb8gdNqHjyD3fUxX1J4MwZP0adOhU
 16ZqpioLqjR5dUWBBemWu729puq6dMZ7XQ5obHwQ9bT/KwGYIGKgeHL0icHxbCpMX4ws
 3ZdEAeasknBnncaB0zS5LK1Z/YXjo015DA43+hwFmC85wsEqK31/3cg5uPt1D2PlkC8w
 P22lJEUrlhl6aoO/Nm5PcL13RvVZqqmtXJugMvNQo1zxIr4TyqOFelweGHPI57ZNDWjF
 H3Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXP5KfEoax9q+7vOpvtvuuXnr7HAp6WFYYGjNbRExlciKyQVj5BAX+jyFtQdK984g1lbvP7QFFousla/zRW+USfcO3A0QRcr62RSMesarESObZwwaTjTOe
X-Gm-Message-State: AOJu0Yy7Gt+sT3i3+0xlpx4/xEuge+RhxQje66/QTMLO8nAEgd0M6JJV
 n4suVoAvDQxGEGhAQQpyIIxQ7BSy8FfLunN7WV8ddAEIO+g1DpgwgglRXhaPshI=
X-Google-Smtp-Source: AGHT+IEL94VJrEVoPYjUqrOkB9/X0f8WrQ+EyhOfaP3jywV6st9dfv8dm8YAc3A5xO45C2b2nfOdlw==
X-Received: by 2002:a0c:c60f:0:b0:69b:2aa8:dc66 with SMTP id
 v15-20020a0cc60f000000b0069b2aa8dc66mr12430164qvi.28.1713284895011; 
 Tue, 16 Apr 2024 09:28:15 -0700 (PDT)
Received: from bill-the-cat ([187.144.73.35]) by smtp.gmail.com with ESMTPSA id
 gs15-20020a056214226f00b0069942a53f46sm4709704qvb.53.2024.04.16.09.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 09:28:14 -0700 (PDT)
Date: Tue, 16 Apr 2024 18:28:07 +0200
From: Tom Rini <trini@konsulko.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <20240416162807.GP1054907@bill-the-cat>
References: <cover.1713250508.git.michal.simek@amd.com>
 <abe7e535b9e4ee13cea1e6d1c37c8f1f6e6014e3.1713250508.git.michal.simek@amd.com>
 <20240416160631.GO1054907@bill-the-cat>
 <58f122b7-e9b4-4028-941a-0f1b647ffe4e@gmx.de>
MIME-Version: 1.0
In-Reply-To: <58f122b7-e9b4-4028-941a-0f1b647ffe4e@gmx.de>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Nishanth Menon <nm@ti.com>, Peng Fan <peng.fan@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 "moderated list:ST BOARDS" <uboot-stm32@st-md-mailman.stormreply.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Aaron Williams <awilliams@marvell.com>, Viacheslav Bocharov <adeep@lexina.in>,
 Stefan Roese <sr@denx.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Lukasz Majewski <lukma@denx.de>,
 Shiji Yang <yangshiji66@outlook.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Doug Zobel <douglas.zobel@climate.com>, Stefano Babic <sbabic@denx.de>,
 Heiko Schocher <hs@denx.de>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 =?utf-8?B?UGF3ZcWC?= Jarosz <paweljarosz3691@gmail.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Enrico Leto <enrico.leto@siemens.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Philip Oberfichtner <pro@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>, git@xilinx.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Johan Jonker <jbx6244@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Anatolij Gustschin <agust@denx.de>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Simon Glass <sjg@chromium.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "open list:VIM3" <u-boot-amlogic@groups.io>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Matthias Winker <matthias.winker@de.bosch.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/5] common: Convert *.c/h from UTF-8
 to ASCII enconfing
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
Content-Type: multipart/mixed; boundary="===============7170696502279038869=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7170696502279038869==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4eJGolvCP+Hs53Rs"
Content-Disposition: inline


--4eJGolvCP+Hs53Rs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 06:19:48PM +0200, Heinrich Schuchardt wrote:
> On 16.04.24 18:06, Tom Rini wrote:
> > On Tue, Apr 16, 2024 at 08:55:19AM +0200, Michal Simek wrote:
> >=20
> > > Convert UTF-8 chars to ASCII in cases where make sense. No Copyright =
or
> > > names are converted.
> > >=20
> > > Signed-off-by: Michal Simek <michal.simek@amd.com>
> > >=20
> >=20
> > Reviewed-by: Tom Rini <trini@konsulko.com>
> >=20
> > Now, how did you test / find these? Given names a CI test is unlikely
> > to be doable but if it's otherwise scriptable I can put it in my loops
> > and just fixup as needed (like I do today for adding <common.h> for
> > example).
> >=20
>=20
> There seem no to be too many non-ASCI strings outside of comments.
> Should we care about non-ASCII comments?
>=20
> $ find . -name '*.h' -exec grep -P -Hn "[^\x00-\x7F]" {} \; | grep -v
> ':\s*[\/\*']
> ./include/configs/tec-ng.h:13:#define CFG_TEGRA_BOARD_STRING    "Avionic
> Design Tamonten=E2=84=A2 NG Evaluation Carrier"
> ./arch/mips/mach-octeon/include/mach/cvmx-pko3.h:369:   MEMALG_SUB =3D 9,
>      /* mem =3D mem =E2=80=93 PKO_SEND_MEM_S[OFFSET] */
>=20
> $ find . -name '*.c' -exec grep -P -Hn "[^\x00-\x7F]" {} \; | grep -v
> ':\s*[\/\*']
> ./drivers/mtd/nand/raw/nand_ids.c:65:   {"H27QCG8T2E5R=E2=80=90BCF 64G 3.=
3V 8-bit",
> ./drivers/video/dw_mipi_dsi.c:861:MODULE_AUTHOR("Yannick Fertr=C3=A9
> <yannick.fertre@st.com>");
> ./board/bosch/acc/acc.c:440:    .SRT =3D 0, // Set to 1 for temperatures
> above 85=C2=B0C
> ./cmd/2048.c:65:                                printf("   =C2=B7   ");
> ./cmd/2048.c:79:        printf("        =E2=86=90, =E2=86=91, =E2=86=92, =
=E2=86=93 or q        \n");

I think we need to keep the "2048" game ones as it's part of the reason
(can we display certain things properly) it exists but comments and
general strings should be fixed. And I think I can use the above
examples to put something in to my scripts to catch new additions.
Thanks!

--=20
Tom

--4eJGolvCP+Hs53Rs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmYepxEACgkQFHw5/5Y0
tyxKngv+KN55TwUiPhzrmZO2E12hsvfYQydZ4xJsZ4fieMjAzsN54feusrRz29cQ
hjWIR8ZsIHFVdZ9nMAuI6jB1Oz1W8Y2ku5CgHRjq7J5Qybtu5Wr4x9myGNjPaUVz
UaatipZz0t6ENjMt9R0UAON15wZeX8tjsSIvs2Rv82sznSSUYxICnUkPgYDO1ace
MQjpWgQlqx/0p3wmmDd9GCCgxL3EAzvMAvZ0LifmJtwQFo1XzZ8T2gRaWMtUhjKQ
FcNwnt8oWFTwfwE7H1G97vopNTI5aOeeBmZTOdKBrbr4bf1BEXiUDIKVtYORtzJA
Zh4gz0l6TBMuZd3hXn9KPh8zr9GiK3mPOXqdF8guY6T9qh8n3hvvEHVEdw8JOzqs
eDOCHo418A33Ls3uHyGVzuCkia+CAE/EqF8fe13TqBKE/G5kjUUE1C5PMFPYy2TM
JGdiGIc0PFpScZIjvly818MwfH248mbI6ApQq0o8KG9p9Osl95D6kkBraJYSF+Xh
MYkTRKnc
=ZzGS
-----END PGP SIGNATURE-----

--4eJGolvCP+Hs53Rs--

--===============7170696502279038869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7170696502279038869==--
