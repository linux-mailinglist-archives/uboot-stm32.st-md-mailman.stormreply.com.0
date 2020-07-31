Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D557C234D3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:41:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A056BC36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:41:29 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F22AC36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:41:27 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id b25so24104061qto.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LUr9mbauyQlsm5SUJ376H5zkBuSh6A5575G6Jy4EyKA=;
 b=jkZ9K17GnWpg9+4A0ArRo3mBOqkGY9zH+9/oaFD5ADEFPQdBe+lrGSXbPX6YJe40zf
 a8pMdAex6GhK0cwP/AenO6L4cf2+GnaEcguYu1GNp3AjRFzAnKirnJLmexAec73CXKnd
 yES0H5Wiu55gV3CZRgpna/zKjBx8XoJVx8+c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LUr9mbauyQlsm5SUJ376H5zkBuSh6A5575G6Jy4EyKA=;
 b=SNNPlbTLW/nWVD8tidN3siiQtHYI8I4hj8WLZ/zZ4E2VQ7rINWhAvAGuee1Cp9OM0f
 6bJxlHoG4jpzN8JZPM0u7p50S2IfmNMDeVrxpCzpcSrjWtYSchhN/x+fqESE/r9ruYaz
 wBVyHwrHyOU9L1Q6yNpEwijaJGJ7XdkHP5ke0X9+RsU1qkMV+PyBHCRw6SRpTsnnbf5+
 HuIoeRo3H6D6fejbETaQpQwk4zUf6Xs5z5k5VWFIXip6vsb2Lx73iVnJRlfilzcyQLO3
 ABbaPHweN5hDsTqgrrmQmIH/INOSLBXmLcxkAJ2ljT5/LNwSvGKzbFlyKTV87rOJO7iW
 qFtQ==
X-Gm-Message-State: AOAM5309yQdVeYGO+B30H/IPByPT6CXNhSwVvs0RYbygjL7ou8ar3q3I
 B+4+eJ1GlwnU7gQDh1VuNWSKJg==
X-Google-Smtp-Source: ABdhPJw7sf2PqQozG0C6sPmPbRZ1p6Tavxg+375X+L4XkL+eGAGLD92VGz6fmbo1U2cGUGiGTOBGjA==
X-Received: by 2002:aed:36aa:: with SMTP id f39mr5936275qtb.297.1596231686348; 
 Fri, 31 Jul 2020 14:41:26 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id y7sm11015382qta.36.2020.07.31.14.41.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:41:25 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:41:23 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214123.GB6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-8-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-8-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Joel Johnson <mrjoel@lixil.net>, Wolfgang Denk <wd@denx.de>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v4 07/14] cmd: env: add env load command
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
Content-Type: multipart/mixed; boundary="===============7131385319897343022=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7131385319897343022==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQwJCUUiTMMw/Obe"
Content-Disposition: inline


--sQwJCUUiTMMw/Obe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:20AM +0200, Patrick Delaunay wrote:

> Add the new command env load to load the environment from
> the current location gd->env_load_prio.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--sQwJCUUiTMMw/Obe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kkAMACgkQFHw5/5Y0
tyzcKQwAqYWaz9QRsHzeO2uM62WsI29x2vA+on/GLZJV7MFP/3n+c+/4DviTWEKy
MTwt9vNhgD25BZnMLVBe76Hms9GPHSf41e8WJpnULoUcVIQD5DfTHvV2yfo4U06t
ixwa4Ih2A5aVvP5ZU4Q058PoJFyLNsYvFmmxVnPsg+Po/cRhcfXAPA6qam4uLh8r
6Su8xfjIdnvcKKbqm0ACa/0zXmus57E78GnpsBZ7ELEFRvk+2/uvRO1KbfgyxqJ5
adMkUJ5BUlY/cZORNQYV015T65X8RjQWF99+O8mWzZgrQ8WeiA+4uCBBbGPSLhBa
Y7wR+s/JpCn96dvshRVEDyGX+suTrhIrL+Z0lrqHxvz/xaPk6wEY7GW/Iek2OwmS
w6e+oaPF/G5ZltqrzZSh9/goaPMSMioYsgekwcqLvcZLJRLwWddp1yZM26kIvmYI
IjM8vT87iwThwm43jNNfjEd9WWkJi90rapArM/NjrPXIJgCUSnIPXz888wjl4OLv
K4hSJLm2
=ihlK
-----END PGP SIGNATURE-----

--sQwJCUUiTMMw/Obe--

--===============7131385319897343022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7131385319897343022==--
