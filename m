Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD920BAB6
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 22:55:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7732C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 20:55:25 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79F0DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 20:55:24 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id k18so10055562qke.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XCOQbd561d57XYNFeESmGRNB2E1ynJTycKGQj3Vysm8=;
 b=Pjh7NU4aIEMco+lTdum3q00+EpX8vJgPxSGg8sm7jrJ92azQoywF1wpJvkPIvcQYfZ
 /41Md3rrIdAy4XCyyY4PM9H+oyYFYQPh4YhFFmGVqF2AGlXV/YkQXIbA6thBZpMTY/im
 MPAryIOXSscS3cu6VUpBHnyQRnco3L5J5Uygw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XCOQbd561d57XYNFeESmGRNB2E1ynJTycKGQj3Vysm8=;
 b=GgGVBC/eJBGXoszj7zPPZY4utkgvhhvGHX95dWSUxj+Zu8C0joO2mneh7kJjcgIOvt
 yZDNnnTmEx/cJnGNfG2u+DxcpNUfvRucLUQeDdh12XKYoQUi3yIysZMpP3Q2l+zCpsis
 CIQQ9D2Qerri3ACnJ57H6lNfEqTnzscqF6syB21plaolCFrq7jyoOqPrvt9XvT+eAOAS
 5scB0t0gw+nzj/g20Nv2/wDu6dgHDO81COyWRAgPZgaxYilcpOEx/34Lrz31Z5gnCUtH
 d32IR37nxL1p58mtihSJjAm8udXcOajm4IBUtxmA1tA1+gJ76u2GheuoS154RYYj04ws
 VbxA==
X-Gm-Message-State: AOAM530+B9gxv2lv5Vw7wNPK3oRNXZ7qNhomKMz0HbFQ+8ZwIqxFHDbS
 ddP9Z6R6FIeD2YiI2NNVv5Q08g==
X-Google-Smtp-Source: ABdhPJxqf99AAaFDSFEFUQ4ZwbWQ3mu9Jpzc30kS8ol0tq0bZxWdywQIot7GsgkrsQNSR+JV24+VlA==
X-Received: by 2002:a37:ec7:: with SMTP id 190mr4562240qko.49.1593204923454;
 Fri, 26 Jun 2020 13:55:23 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-bd3e-bf60-4b70-2dd4.inf6.spectrum.com.
 [2606:a000:1401:8080:bd3e:bf60:4b70:2dd4])
 by smtp.gmail.com with ESMTPSA id u58sm10259628qth.77.2020.06.26.13.55.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Jun 2020 13:55:22 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200626205520.GI8432@bill-the-cat>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
 <20200625075958.9868-7-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200625075958.9868-7-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 06/14] env: the ops driver load becomes
 mandatory in struct env_driver
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
Content-Type: multipart/mixed; boundary="===============9134357983092965419=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============9134357983092965419==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k040vn1t/h12DMPO"
Content-Disposition: inline


--k040vn1t/h12DMPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 09:59:50AM +0200, Patrick Delaunay wrote:

> The ops driver load becomes mandatory in struct env_drive,
> change the comment for this ops and remove unnecessary test.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--k040vn1t/h12DMPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl72YLgACgkQFHw5/5Y0
tyx3BQv/UTsDH1KfQRBZiNyB5bFfzua2WOhHbLq42bGNYhwzUMJRsyrLR7WqbScY
Bgt2/6AiK5qupmBRjLNFkQUC4KCuhyiNGIciTsj+Uk67VkeOlYE8PBAMjINMyfr6
UPElENATlaO1Mq7YF+sapiQLjG3AfvqQjillyOc9+27vzKtFm2AKouaaDfLOTuhs
o2bxza6BAQ3noL77R3rKKSrrfWM8ZLtpA/d81rEVV8CbYa3LIcJNUScI+tEa9iTH
molVkncjS+XhYA0JVvjRpF1BuyFGa9qxaJkSpOsE9y7QywiQF060bHF6WK24aMMK
ltJlngC200E99XuJAPQRiJO+K0lvODW60no+bKkUGLxaJwH0/T7iqm9iBjwdQkdD
y/Dtp4UL5f7aecwCXZIcyMGfbmtm9fnmKtpj60zNgPfrUtA3j8PcwgolIHgCnl10
HmDQPNoj8yLyMVkLGxBi2X5/N4/AiV6abOVrbQAhoQiYx9yacQ+9WC76Zt+UMRB7
Xbw2HaaH
=pZtP
-----END PGP SIGNATURE-----

--k040vn1t/h12DMPO--

--===============9134357983092965419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============9134357983092965419==--
