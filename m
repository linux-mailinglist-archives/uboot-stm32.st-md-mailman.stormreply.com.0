Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA25D3696D1
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Apr 2021 18:23:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87FD5C57B53;
	Fri, 23 Apr 2021 16:23:44 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4AE5C57195
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 16:23:43 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id s5so41367585qkj.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/elF71RgnclHtUh/PUHxabbEYSlLVABWSglQ6DGuhGA=;
 b=KCRed8hHCHF7gWqOJEGsBrQdU2pfzSG430gsw6GQ0NfFtzu3iwxoNGTzk/2zEUrnMw
 vC/ah99oOn3up6dGFse7df1PNrXZBERR6Z6z782id5RHcr8PA/7zX0VGuqTlqDxBlLyj
 FC9jTBH/sTjdHNSRSbL84lIkJQhiAS1EbkqPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/elF71RgnclHtUh/PUHxabbEYSlLVABWSglQ6DGuhGA=;
 b=OvWl7EsI/2+ccS+Zzv2Cry+j9EevB030Cx1R9wNyTbcRnCZypNYLo7DdsiwBqIjgkV
 cPCdWFeuBjxrEzA+HyCi9cv5/x4wD4BPC4A8rMcHf1D7r1SKq0gRhKYbxojGPnOR6IIv
 U+P8eM2WRz3jYJk3nTOrV3OFNpnRPgKBhSRQtr+S+bXCQ8D+ezE+vyP9548nXlUP0WWn
 d2+dru2TTTn3ciHMIGhASGjxeJW0Zn0seKNYynKCrWWDSo+Wu3OMhei8wz75PvREFIfZ
 Y4uH/+moXLBJgr9BBZM+Jgo7UxukH17gNhuWAGHm6CKRfioU0X1GX1uqmuu1g/Vd9uqb
 Q+mw==
X-Gm-Message-State: AOAM530YsV50ZQLVay3cTbb+FJ3/Kb+VC3xKwY4xACrnNlJKYnI9tVpm
 ue5J59KmCKwDmA77q78MC041ag==
X-Google-Smtp-Source: ABdhPJxNxQWYDn5NQ2nU+hj5SNpXX5FOQvIeuWmMvQKFFuPj4gxJ9yoyXrrGh7xmTU4HLdPqKC4wYg==
X-Received: by 2002:a05:620a:1362:: with SMTP id
 d2mr4893764qkl.93.1619195022546; 
 Fri, 23 Apr 2021 09:23:42 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id k26sm4770369qkg.120.2021.04.23.09.23.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Apr 2021 09:23:41 -0700 (PDT)
Date: Fri, 23 Apr 2021 12:23:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210423162339.GN1310@bill-the-cat>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
 <20210310101622.v2.1.Ifa5a03d3733bf4f5245de4d0e07f433c4889b955@changeid>
MIME-Version: 1.0
In-Reply-To: <20210310101622.v2.1.Ifa5a03d3733bf4f5245de4d0e07f433c4889b955@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Reuben Dowle <reubendowle0@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, Max Filippov <jcmvbkbc@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Atish Patra <atish.patra@wdc.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Thomas Chou <thomas@wytron.com.tw>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Huan Wang <alison.wang@nxp.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, Adam Ford <aford173@gmail.com>,
 Michal Simek <monstr@monstr.eu>,
 Philippe Reynes <philippe.reynes@softathome.com>, u-boot@lists.denx.de,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/8] lmb: move CONFIG_LMB in Kconfig
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
Content-Type: multipart/mixed; boundary="===============7747879707501143955=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7747879707501143955==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W6jpp9LYfwqoNYTo"
Content-Disposition: inline


--W6jpp9LYfwqoNYTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 10:16:25AM +0100, Patrick Delaunay wrote:

> Migrate CONFIG_LMB in Kconfig.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--W6jpp9LYfwqoNYTo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmCC9IoACgkQFHw5/5Y0
tyyaxAv+Pc8yeRSWGF+L70cHhBnkcLZNxKM2p80QB4xp7BMp0e0bMar7SksLZQt/
AWG/nX3Yq/0VMyaapx1WzhbWrG8Hj6f7lEF59zFBTk/m1T0m+9umtXivRu5N29Wv
POFas71jd53wcV4U2TYWyEu6vmtkg5BDswmCyJt8R9C2OHxE+a22FLBppH+spaqg
ZR/KitdrgoRo9HyOac9PfbN/kfYeEbI+JP5hvMexaU1g1Lk9/okciw0DTYKaE4OF
jmvLz80n9pUsoZsdJT9fDlU2o6CBiRhEdFTaZA52OezWXn3FOxi92AUYy08t9lP/
pZUPzYZ5ZZexXcrD1EK3Xe2SSlnZl9lGGhjftFAukc4UOyuZ+CwPqoOasJOAzxUR
nebsW5Ia5OwDtqoT0JZRf1lpr/yUS7ydWsWDf+cULizC2WoGO4Hmffx4f5XNoWWP
zVpxBa/vAtxULE3SBH4ATMsuY91Rxiv/pr2HKZUC5kpZVATFn13scBTr+UO/RCeD
E55uKARS
=UzT3
-----END PGP SIGNATURE-----

--W6jpp9LYfwqoNYTo--

--===============7747879707501143955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7747879707501143955==--
