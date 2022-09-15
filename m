Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B39D45B9C7E
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 16:03:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92450C63324;
	Thu, 15 Sep 2022 14:03:15 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8066C0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 14:03:13 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id c19so11344581qkm.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 07:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=+xGzH+MzZIgMOpzX70OYFNtkJCJjreoWGKLVvaMUFEI=;
 b=XlWt0M2qDVntUAN0B3iq7YWQmeHU7nKVqj1i9LyrC4JhOfP38n0+UB9IeKjRiupQG6
 e/gPpqp/c/s4EJYVoRQgnwAezt5uz+FT46/2sKpCQXidG7m9aL1VD+8HbEKMPZpuMSA4
 RXOukmNgUYLXHocvKKPAWNEUtbgwrK9bdzs0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=+xGzH+MzZIgMOpzX70OYFNtkJCJjreoWGKLVvaMUFEI=;
 b=K/mqWRZ7r3mxMJqU8O+3KbSjq0jMm2x+5VhBf5iIdSMNXFrcQh2SuK7R2S/sEIBcaJ
 o7aNvGvO0fbcYmKuUEEVCGDWyc+1BWDrgVxIkhagrQj0xMG1PHdYzQwKQbkw5QKaupU+
 zJcjv5QJqPKeqW+3IDmWocYu5g47rnRmbKYXmWpj9l09VO2u3EWHLnzHHrSH1dwqCsea
 3c6zQ1+su49E3NeNWBlpIZTqIdSvmSpxTLmWaKyrCGKeur3HFK3KCdOhx8sxLtxYsx+6
 s1lsdLG+zQr23nqPn/Os5HwdczC9WQFitOtqs1p1afRbzS+Nz+SNFXyzlvkaoJiZbsP2
 3mNw==
X-Gm-Message-State: ACrzQf3Rcjlwf/YdpA6kDMJAnSDIT3hLBimHKqsbk2PFVQQ1o0XA69rt
 lslOwVHO0zWoo8Tvlp85173Wpg==
X-Google-Smtp-Source: AMsMyM4B3vXDGTtIl6u98/Z/98lF38Xxh58WAIR34UJ9/Twagur1B/s85e4GG0iNPLvxSV2Ur/Yx8A==
X-Received: by 2002:a05:620a:4554:b0:6ce:4e75:fa2a with SMTP id
 u20-20020a05620a455400b006ce4e75fa2amr99398qkp.281.1663250592532; 
 Thu, 15 Sep 2022 07:03:12 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-6011-212c-4988-e1af.res6.spectrum.com.
 [2603:6081:7b00:6400:6011:212c:4988:e1af])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05620a0c4500b006c73c3d288esm4124479qki.131.2022.09.15.07.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 07:03:11 -0700 (PDT)
Date: Thu, 15 Sep 2022 10:03:09 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220915140309.GK6993@bill-the-cat>
References: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
 <20220830120914.2329522-3-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220830120914.2329522-3-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Eddie James <eajames@linux.ibm.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/4] gpio: Fix pin's status display for
 pin with GPIOF_UNUSED function
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
Content-Type: multipart/mixed; boundary="===============1273352567859274483=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1273352567859274483==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JAtnJwvplI04zgov"
Content-Disposition: inline


--JAtnJwvplI04zgov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2022 at 02:09:12PM +0200, Patrice Chotard wrote:

> Even pin with GPIOF_UNUSED function can have a label.
> The criteria to add or not a space character is linked to label not to
> the used/unused status.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--JAtnJwvplI04zgov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmMjMJ0ACgkQFHw5/5Y0
tywBwAv8Coyv+cozU9o0CRfFbi5NI1AZMBx8Nmwfi0jg6c4vrsnKKuEYJZN1/cIY
7P6WMRs563Z39xYJ9afh8zGx7y8nLdoDFGMrpjLgJzVY/QOZ0utAeBcfUnzzmZRE
cGLTqn1KhnTLBoDvqnrK0+/mrKgEQWZqrZo+NQqpDJK6KuxZ/Tc6aRMU8sL5fj0c
LcSWvprS2ppsHQ9HTcWdOvT92TloqUWU+PjS/uoRHfTpUo6tTHt+YyJJHSWjz2RV
ENs/Zwzu4ENSssLaxRQzWJESgPzsUIWycMBZc8gw7l9OxoJlDMwWC0d1u9mhiBbz
E1Dk+hZ70ZsJhqHbwRIizlvYpJI91cWC/4fka6CMKpzv0du4QZs9SETPR+MHBdsn
7jy/KRpLPC3YBclku4lVA1K9Oei45gZpgXFOG+1czo2GRgEPDYlAVjxbHFz+zISV
LsIewxrEqtsyQwEAR0EOCkbmQ2EGOjzgBml3mlU8STrH+3bqnQIVXbRQ5woX815L
oa5Y0I0B
=R+99
-----END PGP SIGNATURE-----

--JAtnJwvplI04zgov--

--===============1273352567859274483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1273352567859274483==--
