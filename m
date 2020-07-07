Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEB52175C0
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 20:00:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 993F8C36B29
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 18:00:39 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7A9AC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 18:00:35 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id e11so39044105qkm.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BpFCxYNWbHIyySbtJxh0nfOKHVWqfnOLgs1JDEE/d4E=;
 b=HTevi73xhfKb0XxFH0qPYyK4a9j+AA7bFtneJY4gaAfambz6KHFo7LM+88Q/x4dI8o
 LmVxA0/mnNA+pLSPZfa+9zf5Gq+AOdY4QQW0xX+FTsv71H5feLomsHfaFKZryVPdejAW
 ocn1v8pIHfLpovqMxVcRV3bPEY8+MfhPErZd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BpFCxYNWbHIyySbtJxh0nfOKHVWqfnOLgs1JDEE/d4E=;
 b=TudiWOSpWn8RdTUEVhoMJ6YgiTGVO6hNSK/4PaI9As1ydzquHEkAr7ViOePollJu0V
 XXwbpEYz9p17UFPvyS5LfdhJSF32/Dk/XAfn1ZVDWsFcaVgZTWTS9/nXKZw9sLqGS6vt
 jivsjE8qaqnTf53qcAY5wixjxwaHO/ip90nJxJK0xmJAe4tWrB0jDVnmwymouWjZkLni
 zTyn5e7NUAvacH71MoKT4zAR9vd/8H8n3OQx4rrnjCmM8zh0BKZo3cpGr4LTpDhRpAnb
 /c1yJPAzlblZ8q0B/R9jaPu5fKjjxAH4gEXKKcu2dR3o6Hb1bSYeBv/iFCvPsFjSuTa8
 b/fg==
X-Gm-Message-State: AOAM532Q0yQ3JMfuQIQkrLEZHCCoDeX/rXXRWdOQzqlteYBGaYXsH6a5
 iemNj73J64yAAg8433nO9Tf74g==
X-Google-Smtp-Source: ABdhPJwHp4xbYRCaguX/6Pw7mc+gVPbY4lG1Kp9b4Qid+GUGvTtc0wtJnDnkU55xNW6kDDdZfn5aTg==
X-Received: by 2002:a37:ae01:: with SMTP id x1mr49101603qke.179.1594144834240; 
 Tue, 07 Jul 2020 11:00:34 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-dd52-ab8a-1bf1-56f7.inf6.spectrum.com.
 [2606:a000:1401:8080:dd52:ab8a:1bf1:56f7])
 by smtp.gmail.com with ESMTPSA id p186sm24702118qkf.33.2020.07.07.11.00.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jul 2020 11:00:33 -0700 (PDT)
Date: Tue, 7 Jul 2020 14:00:30 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200707180030.GW1306@bill-the-cat>
References: <20200702154345.8436-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200702154345.8436-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, u-boot@lists.denx.de,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Simon Glass <sjg@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] cmd: env: use ENV_IS_IN_DEVICE in
	env info
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
Content-Type: multipart/mixed; boundary="===============4883249044385807501=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4883249044385807501==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I6qdtgfjj9z6AdGX"
Content-Disposition: inline


--I6qdtgfjj9z6AdGX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2020 at 05:43:44PM +0200, Patrick Delaunay wrote:

> Use the define ENV_IS_IN_DEVICE to test if one the
> CONFIG_ENV_IS_IN_...  is defined and correct the detection of
> persistent storage support in the command "env info"
> if CONFIG_ENV_IS_NOWHERE is activated.
>=20
> Since commit 60d5ed2593c9 ("env: allow ENV_IS_NOWHERE with
> other storage target") test CONFIG_ENV_IS_NOWHERE is not
> enough; see also commit 953db29a1e9c6 ("env: enable saveenv
> command when one CONFIG_ENV_IS_IN is activated").
>=20
> This patch avoids issue for this command in stm32mp1 platform.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--I6qdtgfjj9z6AdGX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8EuD4ACgkQFHw5/5Y0
tyyj5wv9HPCdnn+zM02mnDc1+JbKbO1eA+dLiyDmDPImr7Il211OkXAP6Ew8KuEL
wD+YdDkkedIX7Vz7lSjqKIuY/MogQEGhsazEQERlA1rLkRpdw234tD9emOijMvhH
hD4GTW3d0n+jK8L/AkATwOZOjj0N07UctO0FY2t+qPKiIPLcD+vaKH7MG9QjIb/g
SmzY9vjfI4iy1cLnyti5lUJWOUNEipJVYiUP/n3yeuSYfFCpD/xmPLEcu1OYNQiW
mnaFsJq9DlZqVmiKIbv9I0Bx1h95L+U6Wf1qoPHPCDQ1H5doRbhRxOxHsLwCUmPJ
TAQ/PmJ/D4an5BO5A2d6yQcFe3jsCCGTDDiyZ1gbDy42dWw2JXsIAabWqzgdaNQ0
sVtbtYh2gq/XXPO+WouAkjvsG+Mu7StVItb46rdp63g58iXYoexOKJMpvBxFqtSK
ybTIpnCIiCML1PYlHTgV/zrAWqKk/ZNf64ZiMCawT8OYsiIqKs/9grzC49yRgiof
3mjw6Sa9
=t6Gy
-----END PGP SIGNATURE-----

--I6qdtgfjj9z6AdGX--

--===============4883249044385807501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4883249044385807501==--
