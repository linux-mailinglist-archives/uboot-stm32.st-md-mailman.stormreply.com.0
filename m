Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A8B200CA3
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 16:51:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EE28C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 14:51:47 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50E15C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 14:51:45 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id di13so4545834qvb.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JtWMR+ouMeX/9VXXTOXzmV7dA0Ae5c0o56jAbCX2yeM=;
 b=tPUK/f6bWxpbHREq719J0uUbTPFg9DdPmo/t+f0yt4LDDQ+NC6gEmi8CQrutdzXW6s
 DjZvJhrXLioXs92U/B2lIgS95rVuyqU4U2zVRPwKXoTrckp+X9o/FU/IFcB3S/TBVP0S
 HbevWwsPSvBOy/B6aXv3tlPhLxywKNw0aHvH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JtWMR+ouMeX/9VXXTOXzmV7dA0Ae5c0o56jAbCX2yeM=;
 b=GOzFBgmcvFzJ+tNe5sNFw5/LgTdXdEIl+zWFoGnuUlKTpdmv2EttQiFHa3HawmGwDW
 P8EvgNh8pUb/FKaree24zGlilIa0I4RjW2XCbwk9hTHHrStRr43lQ+7WR551choBUPqr
 79gczZxWds6Z3QbDw3c7XBxGy1npossK4eamwFTEVK9v1YqMw4/GaE5eGF+HeA/9b1zx
 ns5jXFW9aood53ghKJPxx+Hz8WPOsRT2yxZTtC+GQ4kpUiUhXuPCUDzlmCa074kTxbmJ
 /3/auzwyvNVHDJc5/L6lcUdyKZ0aE46bTbyj5+zewzPdCld1+prTEcSYFKJ7MFDSCTHG
 sl6Q==
X-Gm-Message-State: AOAM530eYc2+Zye1qGn7pER1EyjNmMTfXQXMalxBJpOEeJP3ThVqNd46
 k8wHoreSD4uyXWeQLnD5YmMbWg==
X-Google-Smtp-Source: ABdhPJzpu1ueddgftyUej9ZwW6OZTEAAfzSZvhS8XqToCIMG/+RKORjKu5j5k65hLCfSItYJoPdMNQ==
X-Received: by 2002:a05:6214:b30:: with SMTP id
 w16mr9283671qvj.28.1592578304534; 
 Fri, 19 Jun 2020 07:51:44 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-8c25-1271-b281-e614.inf6.spectrum.com.
 [2606:a000:1401:8080:8c25:1271:b281:e614])
 by smtp.gmail.com with ESMTPSA id o6sm6470585qtd.59.2020.06.19.07.51.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 19 Jun 2020 07:51:43 -0700 (PDT)
Date: Fri, 19 Jun 2020 10:51:41 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200619145141.GK27801@bill-the-cat>
References: <20200619120337.17042-1-patrick.delaunay@st.com>
 <20200619120337.17042-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200619120337.17042-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Anup Patel <Anup.Patel@wdc.com>, Leo Ruan <tingquan.ruan@cn.bosch.com>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>, Lukasz Majewski <lukma@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [RESEND PATCH v5 1/4] cmd: env: add option for
 quiet output on env info
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
Content-Type: multipart/mixed; boundary="===============8068638795562705866=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8068638795562705866==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OPsOAWNf+lTlQ18+"
Content-Disposition: inline


--OPsOAWNf+lTlQ18+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 02:03:34PM +0200, Patrick Delaunay wrote:

> The "env info" can be use for test with -d and -p parameter,
> in scripting case the output of the command is not needed.
>=20
> This patch allows to deactivate this output with a new option "-q".
>=20
> For example, we can save the environment if default
> environment is used and persistent storage is managed with:
>   if env info -p -d -q; then env save; fi
>=20
> Without the quiet option, I have the unnecessary traces
> First boot:
>       Default environment is used
>       Environment can be persisted
>       Saving Environment to EXT4... File System is consistent
>=20
> Next boot:
>       Environment was loaded from persistent storage
>       Environment can be persisted
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--OPsOAWNf+lTlQ18+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7s0PkACgkQFHw5/5Y0
tyxuQQv8DtVDucO5+fpOFGj29od7NdqgZQLZSUaANeGMOAPipFGrTNFFpZDO48Az
PElFCGwXlodglyZJkPoIy2lS++t4I92yAwzQQxXzXzTCGcxp+nqzElRtwrOl8+BI
fzsmwXVgP1SefFjHUxhrwoQUAAhhPYBQ1juu3bytARLGxpNV+hZw/+ywkgq/OjyL
ESBLVVh5BXhe+iSR4bFvBgsZKyRJrgj2H76Uw6c9tlf/bcEi/Tmti8HamTJevh+p
V/cNuQflSjyWumgqd9Y8k2XaXj4tzbGRbS5wQijSIK7HrpZLI4+oAhzU5cMku9YY
vwDaZlQuahxCCsJWcD9fWpOTVrDVu8LMZHu5o6EQVBnPOm+yMwX/piY7K/2S1B7L
CcYljQ0QPODuzXgz2XrYeuIS7IRp5StFCgC1VMTBX1K8h/itYanPwwDsToXkyf7i
6xETapBQB6b7RjCjICGxsH2b5rko19JjTvyTtBbCKslINdDVssHZJ6N3V+xxZnX8
CnljHJJG
=0IAq
-----END PGP SIGNATURE-----

--OPsOAWNf+lTlQ18+--

--===============8068638795562705866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8068638795562705866==--
