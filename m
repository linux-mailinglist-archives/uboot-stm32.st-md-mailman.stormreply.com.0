Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 887B485870
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Aug 2019 05:16:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FED6C36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Aug 2019 03:16:47 +0000 (UTC)
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 263A2C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Aug 2019 03:16:45 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id j199so33339611ybg.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Aug 2019 20:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GvxJOI2ibC2dXJErmHswXoXd5KY0nmOJlJ7dSPq+/W4=;
 b=mHqvuKgMWTcJcJK+UuMqnIg9YaboXLKJ4zKIsrMxVFiDtLqGdK9RJGA51+cupNWBfV
 67U2sCWDvKKrCS5GWDoHlgmIDpJofZoAEiriCUXcpkK5oYxmKAQrmXR2OdWsCHw9/7I9
 JPq3Y4DePVZo5tyk+WXwfutstRV5XaR6SUY3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GvxJOI2ibC2dXJErmHswXoXd5KY0nmOJlJ7dSPq+/W4=;
 b=FX2sMNjFONW53orWBJMonVDz78erdMSR0IfJ4Fa+c6rOvukVPuCr4N7QWvpHSSWZRD
 uTqKlhQ3VplxZ5NspB1bnbkHYir+IpmFwIewrz+wWB0Kjse736OuA6stXHQAb+V3X3QV
 3cshonQUW8f7rbVFBra2gcNYrInpvi2CSMEgYhZl4D4U0qlnoaLWm9e8JV2Lh+78kT1V
 YE7AgZZU94FgO6ZT/CELg73R0RebcMIMrImdn2Uen0UZYYRdLr+H2nYb0VQJqrLudkCU
 8KqjevuHNa/6ohT47L9RyJvVfRHkSuOHeVC+qEFb8NvPmeg8fNJr8/TOGJRbFQVq+9Zp
 wxbA==
X-Gm-Message-State: APjAAAVR9Itt/0/H6s1ZKHBtJ57RYuLzJt+aFcE4W8T1AoAHmah/k0xj
 sLqH85EUj+RuovDm4vYoWdJOWQ==
X-Google-Smtp-Source: APXvYqz7NVkrwjGjLbWwb067/gqw7B2yabhu6z4RLca34xqua8qDW6ANc+EFYqMQTgDgXqAKFlDGLA==
X-Received: by 2002:a25:d14c:: with SMTP id i73mr8629285ybg.367.1565234203906; 
 Wed, 07 Aug 2019 20:16:43 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82DE-5CE2-C4E2-4F31-D572.dyn6.twc.com.
 [2606:a000:1401:82de:5ce2:c4e2:4f31:d572])
 by smtp.gmail.com with ESMTPSA id h5sm20839086ywa.6.2019.08.07.20.16.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 20:16:42 -0700 (PDT)
Date: Wed, 7 Aug 2019 23:16:40 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20190808031640.GE9594@bill-the-cat>
References: <20190802125810.9808-1-patrice.chotard@st.com>
 <20190802125810.9808-3-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20190802125810.9808-3-patrice.chotard@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 2/2] console: execute flush on
 uart when silent is removed
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
Content-Type: multipart/mixed; boundary="===============1863482639846472932=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1863482639846472932==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dnvf+KcI+0MByPWJ"
Content-Disposition: inline


--Dnvf+KcI+0MByPWJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 02:58:10PM +0200, Patrice Chotard wrote:

> From: Patrick Delaunay <patrick.delaunay@st.com>
>=20
> Avoid to flush buffer when silent console is activated as the
> console can be reactivate later, after relocation, when the env will
> be updated with the saved one.
>=20
> Solve issue (missing beginning of U-Boot trace) when:
> - CONFIG_SILENT_CONSOLE is activated
> - silent=3D1 is defined in default environment (CONFIG_EXTRA_ENV_SETTINGS)
> - silent is removed in saved environment with:
>       > env delete silent; env save
>=20
> Only functional when PRE_CONSOLE_BUFFER is activated.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--Dnvf+KcI+0MByPWJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdS5QYAAoJEIf59jXTHXZSWVYP/0VetB/JFs/mTK7KJrFhCpQZ
q3u9TR/Vxppk7fGZm4urcBHR9ttAQVn5A4jXZv13+VIogVxhgsisYJi1lEUG5fde
AvBByZ5tIT+66EwT9AJvWwIb0+Tle8O20RzVcF0J+Hz9xnX4oONESLVP9f0OqB5E
+u+QEbQ07vGui/FRj1958JEPibbB2Fhm9FtZlIXotcBkNhlBD35jwiVbVV1od7CS
VRD7IgksjOYTSp7tg5ETIkWI/I+yFkA3wij2xjRUw6XB/EwxFHA/SAjzSgk7EACn
3tEtlDBrjP+6yfnh7a8cvU2o9tbayMAmaDwQk7I8KJfQAyFD+n53nVHHIsCbZ39t
aTds/aPRRBZLsuUE4cj29M/c3ADRPbt2zulXkMki7fokfpgAz1CprPqSfBkMcXI8
CIgRLPiVwPbZ5uCqFaTEiSgiOSucTd3dS3XBJPV99FD62sQdgQ6HTkEisfycxk91
y/cjt/XMDWOofqJQtdWwkmOESMJTfzo0hl9dR/xSH4RIwmlDQp0UwFH39zoC5vKY
etIXCGaRf9hfZ4toHqM2j9afjsr7Z85vXXIqE6OFNSdBkrEpl8d53g9qQFFxfWbX
42auzzhf//LSybKyl98BRfYxtTarWKez8dJHzMpoOw+pFAlcaGW2Bh6cjaBkiQ6m
ddXYETL0bSSj6Qw1Kd+q
=DO9Q
-----END PGP SIGNATURE-----

--Dnvf+KcI+0MByPWJ--

--===============1863482639846472932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1863482639846472932==--
