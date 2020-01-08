Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFB134CE4
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 21:12:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BBCDC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 20:12:19 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F41EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 20:12:16 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id j9so3888680qkk.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 12:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ERJ5pzPiaB2tz2OM3hhi2IBbXK7oHgd8teoHgMDSzZU=;
 b=EUVvTh4T40JtqPj9ilhu96JLKWqlGb17cXl+4lgo3E0921gPjXkM/HC32gK9ocFknr
 hoh6nKUvxeDC0cUgnFyqS3iobPfOcxbDbFHuA3DyNt8xKTyEPUuC0InHdR+GWL8WvOvp
 GqXT5ClG73OLNc/e+O1AZ5J76viN8vVbOHbHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ERJ5pzPiaB2tz2OM3hhi2IBbXK7oHgd8teoHgMDSzZU=;
 b=Rhu4KiUubXhrE67jN1zfNA6FIsxGyHovoIof65VIzxPlmd7EyZ4X4yb9NYMsT1qZPg
 Jsbv221KNY+qMZi1WfwWh732wZs667t/lLmk+RMyOenCAXzy7az5tMlzyTQl1rMI5x7q
 8Fyn75p1YJ0Cl9JLCUcjFcod76W4OIeXlZ3HteY76kWV8yaFNaeWrRSiJ5O+cPE257/E
 duRavVM/JutLbO6efxtFPl4emUAzdBumIL0eX8PTLJBe/Bx7l9bQVqAHalPioICK4nE2
 Pr/7lREMLKEGnDdqJ4+IB+guP1vVN4Y+j+r11Id2EWYWd85HiJqdEvYvxif+SR2M7vKe
 QEzA==
X-Gm-Message-State: APjAAAVkN4uzHOLm6qyRDE5Wy5ZkwYTxExURO9BmioL3ImntYzMEbINk
 bjjRKQPCjnqcHR/8ik5IsDdmrw==
X-Google-Smtp-Source: APXvYqxtSfiA9WgvpsTmyuDoCDHg1Quh2Hzc3zJUbPNjMVQosCyaVYQLL1sxp3nPtaOBywfn3fMsNA==
X-Received: by 2002:ae9:e907:: with SMTP id x7mr6206505qkf.298.1578514335223; 
 Wed, 08 Jan 2020 12:12:15 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id c84sm1931775qkg.78.2020.01.08.12.12.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 12:12:14 -0800 (PST)
Date: Wed, 8 Jan 2020 15:12:12 -0500
From: Tom Rini <trini@konsulko.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20200108201212.GI31026@bill-the-cat>
References: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
 <1572442713-26353-7-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
In-Reply-To: <1572442713-26353-7-git-send-email-fabien.dessenne@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Suman Anna <s-anna@ti.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 6/6] remoteproc: stm32: load
 resource table from firmware
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
Content-Type: multipart/mixed; boundary="===============1369433372410411316=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1369433372410411316==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6S+CllbbV/7E5K18"
Content-Disposition: inline


--6S+CllbbV/7E5K18
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 02:38:33PM +0100, Fabien Dessenne wrote:

> Load the optional resource table from the firmware, and write its
> address in the dedicated backup register.
>=20
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--6S+CllbbV/7E5K18
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4WN5wACgkQh/n2NdMd
dlI8gBAAilA8IYRVmhNK3EC+z4ksNwnh5uW1BjvV/+Lo/jaCho40Mc6pc5W+bn1u
THzhj+1RIIJVmrQnTk0K0vPDgPMoT2cGTfQ49mQOpccQf/X8l8kCOFOjTb17DXA7
oCx1ZMv17zNqt8QpGpY1GhWHcUaUOfZeDpsOHvN034grZ2yikwyTHo66k60Fty6t
olptbJow2/+rwZ+wqjpudzIGtZ39zejN643HCF5RIly7uWzrJRTEejcL460JrVP1
ls8iK3RF8Ibs6jOBlAlTw8fKh8CdIv60iUuCCQGE/jAJG3j+7VCyDYFv1e5CQNeb
WOuhu3Ka1NzifJPRDe4f3aKn3rrkfj8QQiM7flEt9l9ZUOhFpQ4dgfbf7H5cMXR3
1MYDylg3O7H63zh5whQSQaOb+7g/LNBr+baBD93faGoPnTw1ulIibH5+7Om9B18X
Nv972BqqqlSEY6wwStbEAsXSsSXMu7GNrFqsA6zZK4isQfTwp4MxasX8EOshWPuu
mDCkSlsQddO+ZgQlwhzU8xFGRFvRQn3chyzp6bFnSSkRrbJPuYw49Oa5Bre64TrL
W5CuHpTWdRXDRxHPFe+cFmRRNtLGPMOKw/e25bs1Z46SoNB1+DG7iAEJc8Ewn/fe
6ojkD4cTsE9t3fUt92r1y+Sis6JD8JpTViHcwDKNXxM3S+M0OtA=
=/U1M
-----END PGP SIGNATURE-----

--6S+CllbbV/7E5K18--

--===============1369433372410411316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1369433372410411316==--
