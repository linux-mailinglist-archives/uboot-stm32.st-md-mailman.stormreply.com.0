Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE35F2F8DCE
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 18:11:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FB3BC5718F;
	Sat, 16 Jan 2021 17:11:37 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7743BC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 17:11:36 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id n142so14949124qkn.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 09:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=d3RrqEqPH3hJCzCtkfXq9CcyDgNdF5RZ53zxgCzbkc0=;
 b=eZIR1r21JFIEqKg1Xi+Wogol28q1ptTBrSLkTioSHVC+xQxvMgM35ahZBWlOGJbLg/
 6iDHX7gUcXCMGWYVZirJlcqRhfKd7sOSgPpxZPiGhCbGtdDTFLvr/1Ee+5m1m5NxbDiQ
 xG4pFjDuanJ4fIUZ3hEdOcDIve1T2mLLDNREE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d3RrqEqPH3hJCzCtkfXq9CcyDgNdF5RZ53zxgCzbkc0=;
 b=peMFF32/l1o1UAxHozBaCcV71FTqgf98bNi8Fee2lV74dO3cUFRTy88TKbY+7DVIHp
 huTYMU3SDYaO1X/cQW3bfdWZIoyBS3sEzeKdCLBwtmbobRWJe5I7izhSoOJMQ98X1TWR
 ZbqLXU5We9UfzvXTZ0gBMip7OpfgGK6sPqmhzhkzanyD2Vug0qJjPxjkH2Njpbk7jiRK
 GYOswcCd4ujo1o6tM4x1umJ5jjB0FMAj8sbWGALnYnrpnwGTQ6iVShDthDm+Y2TAXdmn
 2gauldZKe0TfRiKah2LTj02N5Zl0hBHIZySpWrW/nTeBpyMbyGImH8KEDtwvnGTTAdH/
 PSTg==
X-Gm-Message-State: AOAM531ZWfL1WJcA7wSDP8mSksTYjGnH9SBftgXL5CljB94ANhu8skfZ
 +iLw1YjMQf5QiKJLwcqJLB+LhQ==
X-Google-Smtp-Source: ABdhPJy9Jdbt36gT6EDJYykv94pSgVJs3bHLIi8Q6qAk9oKpmVQIgag+prLaPeDbI/fWuF8iu/7LIQ==
X-Received: by 2002:a37:b543:: with SMTP id e64mr17596823qkf.10.1610817095130; 
 Sat, 16 Jan 2021 09:11:35 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id a206sm7373781qkc.30.2021.01.16.09.11.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 09:11:34 -0800 (PST)
Date: Sat, 16 Jan 2021 12:11:32 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210116171132.GA15284@bill-the-cat>
References: <20201119090843.5614-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201119090843.5614-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/3] test: cmd_ut_category: raise a error
 when the test is not found
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
Content-Type: multipart/mixed; boundary="===============6973275692486441479=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6973275692486441479==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 10:08:41AM +0100, Patrick Delaunay wrote:

> Raise an error when test is not found, for example with manual test
> with bad test name, as following, doesn't raise an error
>=20
> =3D> ut lib bad
> Failures: 0
>=20
> After the patch:
>=20
> =3D> ut lib bad
> lib test bad not found
> Failures: 1
>=20
> This patch allows also to detect tests which don't respect the expected
> format with "prefix" used in cmd_ut_category and defined in ut_subtest
> (./test/py/conftest.py). When I execute "make qcheck" this patch detects
> 2 issues, corrected by the 2 next patches.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

This is a great idea, which I cannot apply right now as it shows the
setexpr tests aren't right.  So, I'll try and look in to that if
someone else doesn't get there first.

--=20
Tom

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADHjkACgkQFHw5/5Y0
tyzLkQv5AQA0X1nn2OhOEsCm2g8r2WXiJf9ZZiz8XUujfDVTb/DshOiWcHI9b/g1
ooDKYaD//Cayd3oQQX/Skf4vvldW88lC1G6xdbtiu3xpPrL8Ktd8J5Up6Ujk7IfA
MvDJwSCqzPfJrogC+g+82+2EAXVMg+5o5NUGLgDVcEVIe+p3hLlCJsoh373NM40p
8KxFCGAwdsQJI2FbZctDcwmJ7VrHbAwk+eKN4uGbOvAFi94KxFPID8+5FoaLNwVf
+QviBqXegzwEM9eUzphJPc78EQwhBF66GGb1sGjGnMX4zthdY3d7Zvb4UkinkeDk
bVO+rjAJ2iYzJnbA7zlcJP/DHz7di3YSJtIPZsw3QyB7wU4IjL5D7d3Oi4umzhZg
oCOSePsLlKmE6PRgHrMQlRW/UM/oH6qHhHfGuEeJKDF4ATkBQ86KA+a8oTrpF7FG
+swVfP/zjWnu9r7khiRTjSz9y6CYOn+EZ0MG22CVDcwurzihzfBmgUDIm3mvP22c
xMUbmnq+
=jFpv
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--

--===============6973275692486441479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6973275692486441479==--
