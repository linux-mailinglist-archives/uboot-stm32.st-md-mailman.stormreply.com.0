Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4892A99FBBB
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2024 00:52:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EACF4C78030;
	Tue, 15 Oct 2024 22:52:54 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2A0DC6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 22:52:47 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7b115d0d7f8so33534785a.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 15:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1729032767; x=1729637567;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FY8C1CeAogn0+gLT7psVb27HEjVEe52fHJXiglhlTHU=;
 b=e1QPUxXXQ2hLJO8VS70XXR9KgYqycp6wuWw3qsDILspE9dLw9SFYmIYQFZ5GM361U0
 N+lAqFhdY44FBNJ1AcQ54CvmY2i78j5WmO/1Oihx70cpMiIGVAgR1OMoLrY/gNUZ9LK5
 6QV3GS2t8QZwEVaa4eW6r7tOk/ftbV1fPcwtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729032767; x=1729637567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FY8C1CeAogn0+gLT7psVb27HEjVEe52fHJXiglhlTHU=;
 b=Ewdnv5fut+/g4xRewIMz1K4pY7Hsy/k9En4kq9iy6b8oZhyeKX2q87j63QS/fj4FjV
 7einzjHjp+sdIbzQujx6AtS+66BE64MPiz/2M1Rnbf/hHINahw9F2hqof0bLr/qlCH71
 Y+J9/HSPL0sJyq8ihjuj/iaadRe/meAxqNw43xivBDUlIcx5eKR0OhkQQI/A0XJcMtgx
 g9Ru+BSKEqyeCMt07mdewqyleQS+KJBkk27LHNVgJwkqeOafdL9FISZT7a4QWZ0u9cE8
 llxA2h4zX6d/hkXptlAhn4o7i5Imjbpszc7FBaU8DLjGdFtzZ3SX2uIgqVCsnahrY73Y
 x4KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXagiQDGiyU3Ws41YFd34b4ZW42LiRTXuukjBidZKz/sHxSUhqWyCc2nzBFQ/d5bW5eQzvdiuH3B/MBDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzAWDeehfLC343FcMeP/cQWlGWy3yBeAZty7B2dUUa1A+vks/8e
 9f24sH+b6LJvZNsVsyZKGikNlKlSVeoAt0YMWnn1n8c79MaHXZFgAP+/tkkWZZs=
X-Google-Smtp-Source: AGHT+IFGoph4oC2GXqgyOoTaEsq7umkzGfdyeI3Km0um1JLd03Y42obuZWT+qrFuS19AmdhyAcRNRA==
X-Received: by 2002:a05:620a:1910:b0:7b1:21c4:ecf8 with SMTP id
 af79cd13be357-7b1405da312mr399969585a.28.1729032766646; 
 Tue, 15 Oct 2024 15:52:46 -0700 (PDT)
Received: from bill-the-cat ([187.144.65.244])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b1363b4fcfsm117573385a.112.2024.10.15.15.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 15:52:45 -0700 (PDT)
Date: Tue, 15 Oct 2024 16:52:41 -0600
From: Tom Rini <trini@konsulko.com>
To: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <20241015225241.GA6412@bill-the-cat>
References: <20241004230756.371153-1-marex@denx.de>
 <172902143755.5381.3133865412226742988.b4-ty@konsulko.com>
 <8cfc2a0f-dfef-4528-95fa-298bfc701ac7@kwiboo.se>
MIME-Version: 1.0
In-Reply-To: <8cfc2a0f-dfef-4528-95fa-298bfc701ac7@kwiboo.se>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Sumit Garg <sumit.garg@linaro.org>,
 u-boot@dh-electronics.com, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 AKASHI Takahiro <akashi.tkhro@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Peter Robinson <pbrobinson@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] Makefile: Drop SPL_FIT_SOURCE support
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
Content-Type: multipart/mixed; boundary="===============4179270508731845907=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4179270508731845907==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q1Dsf2z0E0ogpZNo"
Content-Disposition: inline


--Q1Dsf2z0E0ogpZNo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 10:48:12PM +0200, Jonas Karlman wrote:
> On 2024-10-15 21:43, Tom Rini wrote:
> > On Sat, 05 Oct 2024 01:07:13 +0200, Marek Vasut wrote:
> >=20
> >> The SPL_FIT_SOURCE is long superseded by SPL_FIT_GENERATOR which
> >> is long superseded by binman, drop SPL_FIT_SOURCE support as there
> >> are no more users.
> >>
> >>
> >=20
> > Applied to u-boot/master, thanks!
> >=20
>=20
> Look like 5b9261fb0b1e ("Makefile: Drop SPL_FIT_GENERATOR support") may
> have broken ARCH_ZYNQMP, it still seem to use a mkimage_fit_atf.sh and
> CI pipeline now fails:
>=20
> https://source.denx.de/u-boot/u-boot/-/pipelines/22715

Sigh, thanks.

--=20
Tom

--Q1Dsf2z0E0ogpZNo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmcO8jIACgkQFHw5/5Y0
tyyhlwv/VOvw0q4JmMcSIm32/NQwL823WnnNONqV1ayCOAgSnP/+J+cABKn6/Svr
NEcr3N/0U6P1swb2KW0wcrrPMX6nfpIslCS1yqhiQMeArxpdQH+jdU+zVbFaTMhU
mKqIw3+fVn9E0+L1xEHvjk+FzAdmOYY3HmDC6S5iaQpQ/9s5bMDN/zgQgYCtN9wP
5xqg64eyr/CnFKRVl6xmIFH1xaEE380iO9uCVdoeUDb8ZMaCeBBvDGf30z2WYEQj
TqKRkSSZsMG35dEmhHwZOenbFIXWL5rQTLqgFa2Zokpcqv7VdiuSmclc/Nff2Wu4
fyAshfopEWHUtOpmPxpn5yPN6bJFiNTisT2Qw60dJQT1AX07S9665fXDxsnHCuNH
WJkOev95P+P7y2VCVkDoUwVaOcDRzLsrHcdzOcu1+m41HcTgJXvCLg3IAxBGp28L
iyzwHrVdknfqs5Er5VJjm77P05HnE6iLXhAN83fOuj7vE1i2Viez+coOMZ9z3Rxe
3OABcBfc
=oBbH
-----END PGP SIGNATURE-----

--Q1Dsf2z0E0ogpZNo--

--===============4179270508731845907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4179270508731845907==--
