Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B922ED5F
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 15:33:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D52B7C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 13:33:19 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAFF4C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 13:33:17 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id a32so12148406qtb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ur6snZeLmyjdBSFA+99LHSh4ScipMRG87+7vbIxPHUk=;
 b=N4cyRbX9Miz/FnbpAwuxIpjXh9qNOROMeU2F02JhvRc+7jTffsdzdJNmWoKlGVX7u9
 ZQX4AuTdl9jB6p4COUoc6syZFYPHLcBSxkIsHFNdHoYWtZOX9Sx8W8kdxp5wSkZwNwvF
 yu1K4nKMkLu9WAXNpHE3mhAwnd0CztrZEaSoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ur6snZeLmyjdBSFA+99LHSh4ScipMRG87+7vbIxPHUk=;
 b=p0KCucLDctk8pPupza8MsUxgenSh679ym3L8lrEPS9r/0gQ+b1aBQvtqLDV9mFGh7P
 3ov31Jy6LOV9muJsmAlpj/tt+SPXdddHJfJj727NriAvsBR/7UBNcuGuB9rKTujHvKOt
 UJi1rhIQOsHkzxYRxjTJgrZ89HpCcCjzhb6AiN0dxV/Cnn+Y+GHPrYq38zmic34nD3UE
 6rM2q2xzRsLEQqUkn5/P+VpXEEQxNo7BG7/sHF1QsguIePj1G4R5X5etnvUY+7P13kDm
 5UJJEM7o8wOvOAb09aeao7UAjj9Omdjml3EoWme3PSN+rqHVCbHe3SAGES2eQeq7hlF3
 ozyQ==
X-Gm-Message-State: AOAM5300t7kTfvDM71ysZjHtOGzwZS8dma/Isk37G/ElwxGRGVRZlzsn
 qC99Z7Q7bsdLwt5s4KZtPuJOSg==
X-Google-Smtp-Source: ABdhPJzgid3fX6axsVU+Tmshp6db/yTgMbt57XgDXbPT193mXOHfEHatElJ2u2SrQ3T/gKeyfwhNlQ==
X-Received: by 2002:ac8:564d:: with SMTP id 13mr19900528qtt.101.1595856796904; 
 Mon, 27 Jul 2020 06:33:16 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id o21sm3178603qkk.94.2020.07.27.06.33.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 06:33:16 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:33:13 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200727133313.GH6965@bill-the-cat>
References: <20200615083857.3825-1-patrick.delaunay@st.com>
 <20200615103839.RESEND.2.Ib5b400348308b65bb50d9bfff5fe681027bff4e5@changeid>
MIME-Version: 1.0
In-Reply-To: <20200615103839.RESEND.2.Ib5b400348308b65bb50d9bfff5fe681027bff4e5@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 2/3] env: mmc: correct the offset
 returned by mmc_offset_try_partition
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
Content-Type: multipart/mixed; boundary="===============7446055011842834434=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7446055011842834434==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aYDVKSzuImP48n7V"
Content-Disposition: inline


--aYDVKSzuImP48n7V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 10:38:56AM +0200, Patrick Delaunay wrote:

> The output of the function mmc_offset_try_partition must be a
> byte offset in mmc and not a multiple of blksz.
>=20
> This function is used in mmc_offset(), called by mmc_get_env_addr()
> and the offset is used in write_env(), erase_env() and read_env().
>=20
> In these function, blk_start =3D offset / mmc->read_bl_len
> or /write_bl_len so this offset is not a multiple of blksz.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--aYDVKSzuImP48n7V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8e15kACgkQFHw5/5Y0
tyzThAv/fxQbINJ8tTVgCh9SGVD5sbSeVUG/L/Uy8LuUwPila+1FBepEcznmlMol
lwkDMj73PnBVZhGHQeU+jaQn+ODKPmJ8HyWixsrJp9izeVTuiucFDNC1zvIbvkMy
PhXh1outIEJCwkLcmds3HEtrokifCBSOcDwiZmVL1IwldGLHe0ajvB1R04NEcS9s
I9dukVOrPCQQteglrRe7O2PxQzobUlFof01cl1Z2AUa8X+rYfQBhnv1bqBao2EaG
QCuVSOc+TPK2KFAAHqaZquBVheI16x1brgrSjPpOxqIUbep07p81NN6eTNVhcxbX
JFWgRs+81Nn+3Z/KXvNIOTTOa3YcZwju3obukIOvapVjQAyZjjnxraJnVK41xs96
Pv0UGiQcrnfffm29hFg8Nv4G7vwFLPgs1TPxoRc7cahx10Xs8bVaxefkCv99nXLW
WPD1iQAFa4u477yNx+Y8qbuquO43Gfiwfv2RPS8Fbk6AxsbxUWMpnXt/bIirWnHL
zb3zqT0E
=2M6u
-----END PGP SIGNATURE-----

--aYDVKSzuImP48n7V--

--===============7446055011842834434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7446055011842834434==--
