Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 362D222ED63
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 15:33:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F12DAC36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 13:33:39 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A93BC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 13:33:38 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k18so12123368qtm.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zbh1zCT/EZRQ0cLi0pwi4Y4pxuuVGV2+xBbAvUgTgZU=;
 b=A0CdR1UjgQmNGJKcTiJfMk9HCp7lYcwF3MXIeUeR11javU+/m7x/XWiDJgPmkLTsje
 CKOmWSkWpxYN5Q5Uu6iFVYhy5QLc3+kTrj3kGNNv0GusvWBQheIR5eTH0j6jXJXeX4HK
 X6aWrupFzSDJwvl2Ld1Bc2FkoNbMqGJL0N8eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zbh1zCT/EZRQ0cLi0pwi4Y4pxuuVGV2+xBbAvUgTgZU=;
 b=TBcl+QmfbLNJ60GiTUVWmahrJa1MldU7t1wyOqsaigkm08OqpNVO9YbIITISGMhUKN
 ofvPchQOAH4P/fjHLOiKWGYrbiyxR1az/sK3NBvI64Vo07UYnG1EXcNMShq6ebIUtGVR
 vWyEYD/ODkgB3UTRT1m5CL6UYjT7uwkJaOrAolr40thQyQ0AQ36/8B684UUSbHEGISZV
 G4+BbcJ3d4cbscHg5iVD/n1b5bniiZyjwEhuSMn8o3e9tUec9LZSwS+5jIsMw8fzDyxZ
 z/DzzxxKPYcFOY/8H6bOfkK41PuuJo8uHLDcldiTL8mcvKHJ2DqvVdI4G3OFmTgj1Jz8
 CTdQ==
X-Gm-Message-State: AOAM531uzCvXimoe6tK+EdTBPlJ0IMcAN1Xaw2Ts4rgHreqF3ZCOShUe
 NrIK5uPykZzAUJwVC7Bd15FLiKcJKfF6pA==
X-Google-Smtp-Source: ABdhPJzjmhHa6xNFbX/FuxT7/yGwRmuG6YXjIUYlhve0drgjFJBceGmKWqdIEw284olNnHJIDn96Bw==
X-Received: by 2002:ac8:6f55:: with SMTP id n21mr21310156qtv.10.1595856817150; 
 Mon, 27 Jul 2020 06:33:37 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id z17sm15859403qki.95.2020.07.27.06.33.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 06:33:36 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:33:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200727133334.GK6965@bill-the-cat>
References: <20200619120337.17042-1-patrick.delaunay@st.com>
 <20200619120337.17042-3-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200619120337.17042-3-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 u-boot@lists.denx.de, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Simon Glass <sjg@chromium.org>, Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH v5 2/4] cmd: env: check real
 location for env info command
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
Content-Type: multipart/mixed; boundary="===============2831677897059654749=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2831677897059654749==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hk6Zb6cduJ+I0Tmj"
Content-Disposition: inline


--hk6Zb6cduJ+I0Tmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 02:03:35PM +0200, Patrick Delaunay wrote:

> Check the current ENV location, dynamically provided by the weak
> function env_get_location to be sure that the environment can be
> persistent.
>=20
> The compilation flag ENV_IS_IN_DEVICE is not enough when the board
> dynamically select the available storage location (according boot
> device for example).
>=20
> This patch solves issue for stm32mp1 platform, when the boot device
> is USB.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Tom Rini <trini@konsulko.com>

Applied to u-boot/master, thanks!

--=20
Tom

--hk6Zb6cduJ+I0Tmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8e160ACgkQFHw5/5Y0
tyzOqgv/X2h1vbMsmMoNAk+0edOUcQ5kkuKWs18AkU4Cv66qJsLpJvKlteUyOiaA
hCLXxI53ppXyoaE4xnZSjaIjq+D7EpTRdcNqnC+Jm4ScS3Ie60Au6SlvLUx/t3Wa
/BYwfLUivnwY1+IYch0wQdUCfrlncuRSLxRbxvF1/ymLOJxgBzEExYh+y7yA/R0Q
qKQFlxIL7kxFBNT3ZKWHf3yNJgb8CXLjwqXACFS2ct9YOIxjxIepg3FaGEOjHOPg
rVyDqHTWhDHDPaFa8lUOp1cw8dFcHTBX2dvFV/ONWoH9zb3Tlrw9yvrJNgdrJkRd
PMEOcrIuhjhSiKCw93DM9kLOuLRLvnhknrKFXPAkIXI3Oyf8NENvViF/c2DeiN+R
iB856U7CqyZ4uT7D88twOLD7F5WkYbILaVt0HWRUDe52iKb/nFU25TclLoW0zW/f
j4bGysblLkl3kAyCMGWMjkLQQKUEg2Rpq6fIE5gCIWjGJdIKL6DoTyPy+9w4CHwX
LWD+giwV
=OnND
-----END PGP SIGNATURE-----

--hk6Zb6cduJ+I0Tmj--

--===============2831677897059654749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2831677897059654749==--
