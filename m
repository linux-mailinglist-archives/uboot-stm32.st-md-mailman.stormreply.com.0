Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F9E2E0215
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Dec 2020 22:35:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72F22C5660F;
	Mon, 21 Dec 2020 21:35:51 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D693C3FAE2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Dec 2020 21:35:49 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id 22so10157506qkf.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Dec 2020 13:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F+2hAUBxnrw+AtudIo18WR4cFNF80un/xmSLHSu5JIs=;
 b=PuPlSblNINSpz/yLh7aaAOe5PxIYJ3xJktGPDBwt16v8+OmhD5n38wxgRCN76UxSne
 9OtYRlmrnm9GeulV0EVyX/6LWpnlxlTAMEmhzPModPr5m/oA8aYrpvEkGmjr3wpgvAmC
 MCCjBXtdKQK3GpQ7xSMbIXzx+WVetTaCQesyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F+2hAUBxnrw+AtudIo18WR4cFNF80un/xmSLHSu5JIs=;
 b=Gctbll/lyDRZiCD2tEZyhCWNrHpIXsJqirUbCxlvq5IaIPH/faXUwOV1OB6WG0mCeY
 hgbjvQQiIopkgSTHi02/zy04kD3qEwjpLDHpTkMO6EbsQDgtQN6qEaoGXy/7WigAYwjX
 gvGnVw6siWvNiDq+4KcT9xIA/zpbe/mfmngLlAwVLAxsvwCerfPJPu0S7yHbgqSkyeXG
 c5Nkdv6u+A3bvqPHjsPUlpnWO+CcfM4d7Uhh22EM86xM9PROh8N0Mml2/HJ0oF3QU+WL
 Q9vAZaIZMwKh2ElXAeNzDHCmIYuo78rdDqoeVtxOV8VUCQnnjqECrHcXFjRS4Qjuo3Jn
 3oxw==
X-Gm-Message-State: AOAM531pT9SuQNh806jJXAzKLIHrFuBDYRXf8LRop77geryQLIWJta/f
 Ht8PyIvVONUTySYmLrXvokb0LA==
X-Google-Smtp-Source: ABdhPJxlcz3EpXlffhrTJbqmt42qotz9q/8MFzoo0kveB43nQqOSSVGCYvF8N/ICKAz47zwPaP728g==
X-Received: by 2002:a05:620a:10a8:: with SMTP id
 h8mr18890218qkk.315.1608586548337; 
 Mon, 21 Dec 2020 13:35:48 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-3781-8c71-bd34-3efa-4219.res6.spectrum.com.
 [2603:6081:7b07:3781:8c71:bd34:3efa:4219])
 by smtp.gmail.com with ESMTPSA id y187sm12091462qkc.120.2020.12.21.13.35.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Dec 2020 13:35:47 -0800 (PST)
Date: Mon, 21 Dec 2020 16:35:44 -0500
From: Tom Rini <trini@konsulko.com>
To: Anatolij Gustschin <agust@denx.de>
Message-ID: <20201221213544.GG24930@bill-the-cat>
References: <20201203091549.7031-1-patrick.delaunay@st.com>
 <9d8e34fa-cd69-f2ac-7d63-0b2da2e382f5@web.de>
 <f0bd0043f95b4364bde19d21902e09bd@SFHDAG2NODE3.st.com>
 <27f75682-4527-ffeb-24d3-420e7ff3bd35@foss.st.com>
 <20201208161630.GP32272@bill-the-cat>
 <20201220221406.725af74b@crub>
MIME-Version: 1.0
In-Reply-To: <20201220221406.725af74b@crub>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Akshay Saraswat <akshay.s@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Yannick FERTRE <yannick.fertre@st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, smoch@web.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] video: remove VIDCONSOLE_AS_LCD and
 VIDCONSOLE_AS_NAME
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
Content-Type: multipart/mixed; boundary="===============0491496193458733456=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0491496193458733456==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iVCmgExH7+hIHJ1A"
Content-Disposition: inline


--iVCmgExH7+hIHJ1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 20, 2020 at 10:14:06PM +0100, Anatolij Gustschin wrote:
> On Tue, 8 Dec 2020 11:16:30 -0500
> Tom Rini trini@konsulko.com wrote:
> ...  =20
> > > =3D> open point: which acceptable target to remove this feature ? v20=
22.01 ? =20
> >=20
> > This sounds like a good plan and reasonable date to me.  Anatolij?
>=20
> I have no objection, this target date is okay for me.

Can you please make up the patch for noting this, etc?  Thanks!

--=20
Tom

--iVCmgExH7+hIHJ1A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl/hFS0ACgkQFHw5/5Y0
tyxvAwv/QvH5zm9g1qw3py+NELllgB2z7OkSXNH4eiGv09LhES9IoBETRDyWWpfh
og1Gkpq4YPU/8qbtFaCk0jPtbHD7DzvNHFpzu0ekH/GXEHnZ4OQ83rAcXzN4Mo3S
dDk76y3oTGILEokR2ZIxLo+8XtdP0dUhmMT2fKzkBqH8NRWsRbpEGHVdvvhiv6eE
+5BAYdbQ52ovUdRaRXenFlpp+550Tb591bTxuJMDDQrAH2Dv2ro9V0ID1aXv3S5x
Go6sumi+h8g6xsP/vzfuipklfXnqs37bglGZJiztliMzYMd4aNHt0J+1rDuemamh
gJ1FL0Fva6i2ylbgSKNHWtF2vff5lc9lkDwxcE226UPQjYUxqw0JLzYQ4jFCQaVf
C1/c82Y20idmEwJezX0Of7lQXNt2ZBHEtcoo3tUM0ByfVH/zE6pFbgFKlFFvZEyt
bCYdpEMEiHoSGYiiB/r8EiXoOBAt9Bwy2Rm1M+RxXlbQOV3P1aOLpcAdB9xGL6W6
8GyEZ7Zd
=rihd
-----END PGP SIGNATURE-----

--iVCmgExH7+hIHJ1A--

--===============0491496193458733456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0491496193458733456==--
