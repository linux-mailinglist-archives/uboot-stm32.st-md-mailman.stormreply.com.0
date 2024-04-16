Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DDC8A70DE
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Apr 2024 18:06:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B7BCC6B45B;
	Tue, 16 Apr 2024 16:06:41 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F917C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 16:06:40 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-69b5ece41dfso14863856d6.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1713283599; x=1713888399;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zudjLydLlprH1FXH7ANF4MrkoqmWrSa4F0lk9M5Ad7s=;
 b=mQbt/o0hk9GLfDrGoeV6IcyEK3mgNwi8CLau+HppvmcOXvPotuL2U1aDWmz5udDaBf
 638+5XLQJmMWNrnSWrDXiDgitsMO+XJ2UTkvyQA9bHHhgNTZcPNoMp8LgdolbYes/fzV
 UA7E6eqvmuzO9MY8Nfe0FU6c6lRfgDvP37Wv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713283599; x=1713888399;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zudjLydLlprH1FXH7ANF4MrkoqmWrSa4F0lk9M5Ad7s=;
 b=F7DXwUIJ1AQ0EXWUh5DNOv8w4MBeBNnQJ1ssdJhY18b8Pso4JMudEWzvlQ34YuAqX4
 /dr2EbtrzJiqNpuM37bKkv8D3IIGXBwKJoZCtt+WHuZF+N9P9csFkPxAR0NuxMzqnFdZ
 CAdi1oLfZSO85miQebr9pV+yZqvZql+OO8BnyCcIhjrkflnEdeQuXvcuFpS/JiUO+Ig3
 5VqlXPAaGevcDq6WemMXKMkkWXLIHzASbqtHaLqPT3BnNSaClaLUK5mMMsaHGoHxWI4W
 ISTzNKx/Zc7bdD9bWjXzcpcYfhtAonswwCVURjhnJs+gm7ssWLcr6RmLppCg0qXv2esV
 WUXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4jH8T4PJlmnWXrK2c9HYRpUoT5xZueqBviD66SdmDxbOWZXPnryX73/XeaepkFnL3zsVidSJael25aREA4xGoC13jaTL9r+QybrqI2zXT3UL/in7QU/GK
X-Gm-Message-State: AOJu0YyrAVJjFMlflZwF3EIH/aOXBSVXx7SBhxY1pqhHdKearDX+1ROb
 xW4ie18oLYIkSBIPrMm1tg4s1KL3qN9Sj7CZ1Sz+j7SnJu3dUF80ZYLdoCwCwZ8=
X-Google-Smtp-Source: AGHT+IGxRcxCzHs1tvGEv+jXW+Vg+7JJ2kiKVDJLv1TTU36yaq2HZXfkIRRBiavBwttfFKMvBXvxiA==
X-Received: by 2002:ad4:510f:0:b0:69b:7ed1:7a79 with SMTP id
 g15-20020ad4510f000000b0069b7ed17a79mr673197qvp.35.1713283598702; 
 Tue, 16 Apr 2024 09:06:38 -0700 (PDT)
Received: from bill-the-cat ([187.144.73.35]) by smtp.gmail.com with ESMTPSA id
 k10-20020a0c970a000000b0069b447066bbsm7595296qvd.78.2024.04.16.09.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 09:06:38 -0700 (PDT)
Date: Tue, 16 Apr 2024 18:06:31 +0200
From: Tom Rini <trini@konsulko.com>
To: Michal Simek <michal.simek@amd.com>
Message-ID: <20240416160631.GO1054907@bill-the-cat>
References: <cover.1713250508.git.michal.simek@amd.com>
 <abe7e535b9e4ee13cea1e6d1c37c8f1f6e6014e3.1713250508.git.michal.simek@amd.com>
MIME-Version: 1.0
In-Reply-To: <abe7e535b9e4ee13cea1e6d1c37c8f1f6e6014e3.1713250508.git.michal.simek@amd.com>
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
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
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
 Johan Jonker <jbx6244@gmail.com>, Lars Povlsen <lars.povlsen@microchip.com>,
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
Content-Type: multipart/mixed; boundary="===============5041925828662717267=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5041925828662717267==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4OrlngvLVt9BgcPq"
Content-Disposition: inline


--4OrlngvLVt9BgcPq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 08:55:19AM +0200, Michal Simek wrote:

> Convert UTF-8 chars to ASCII in cases where make sense. No Copyright or
> names are converted.
>=20
> Signed-off-by: Michal Simek <michal.simek@amd.com>
>=20

Reviewed-by: Tom Rini <trini@konsulko.com>

Now, how did you test / find these? Given names a CI test is unlikely
to be doable but if it's otherwise scriptable I can put it in my loops
and just fixup as needed (like I do today for adding <common.h> for
example).

--=20
Tom

--4OrlngvLVt9BgcPq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmYeogcACgkQFHw5/5Y0
tyyunQv7BArCU1xcrO+M1bVi2Mxx/0iq718pZj7b9yLXe8ArTp+0A2ih7/qm0EB8
MYQpBG4DT+ugG8iLSE6eKhUZB/2niAd06z2rdMCwVgRAT6Qqwhf7T7E+wyJVeCu4
OCkozeNuWZP4qe+NW8R8DkJqVxI7sMk5hLY26H6XIW//GsRCFzLRAr+b8ZlGVBtH
CJ+DSL6gFl2RWP+fqXtr5W3o0J3b6e37u4swFmEvfPR1MqKOFqnWbZJLCgHEDNiQ
An4GZAYiUzpNp5YT73Tf8UPBCBcwR9QWnxK2+4tO3GOCseNGkAcvnuWCCk+Dg5/O
bPIPSR81SDMS5oUQy6OfFdbuPFseWkSWhbV0n6VKKAywo8CvTvHY+LHufST9Gvoo
387W+5/WdRwsiVJRsmtnLbIjavGxpbmpRcVrrvYtsynj0qJBR7pc9uGG0tCdoYGl
Um/2RChbaSIhRfZKCImo6tWTLU9chEBhBzOX7wGJSdkczvHtbMahUnvP8pLt/jMa
JlCQ3PRT
=gijj
-----END PGP SIGNATURE-----

--4OrlngvLVt9BgcPq--

--===============5041925828662717267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5041925828662717267==--
