Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960332BA21
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Mar 2021 20:09:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7627C57B62;
	Wed,  3 Mar 2021 19:09:35 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0A8FC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 19:09:33 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id s7so15064529qkg.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 11:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=imgYfURZUFimJF4iIixOqkS29V8pkt6iAxy5jb3W6Es=;
 b=GR/7bmpg3gp7qL+hon4rVAj7QKz407XDymVC7tC8crtk2J1f8oSP7yK9cBjjPYIJT7
 GZjRr8axr5+6sxKK6pFyBQmM8EofO84EITZ8KTiUwj5eTrMLRNm/Uy1IyfIdFsyfH72Q
 m79yWQ6sw54DNz/gC858mzZ7OAHvBgWFr1uRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=imgYfURZUFimJF4iIixOqkS29V8pkt6iAxy5jb3W6Es=;
 b=myf29OhaVAm1S+Pfgu0jvakHaeOB0GvTHYcHIa+kWAiztAv8frb8N8SxgwtDXU3r5X
 Do6JrK0azqtsreVJ6gnF7gEJqOu4ZCAooWmPUr7aqE5yFa+YeHBMZ7v8bnLOgIlmeqgO
 p9fKKnVzI4ysNkvFicO7ecqzzWvSerCXlNI5j9z9hsCWFD1IitSbSOB4ku0ADmz6nhDc
 Jbn6m2xWYQc8FpjsSmOxCqW83Ktn/oxrbLW0m4MYzbSe0isaQ/t+POy+EbHgZQapVJHM
 ZijmG7S4GUdrGky+xEU9cqLMR1rMovpb22H9Ji+bXSHnoqoZeZiC8z6qIcealB9KGMpJ
 tKiQ==
X-Gm-Message-State: AOAM531ki4wqiKm+ZjVQeL+JLAZp4EV2kjCPPQl3lIXnWKQRI+AWDLb1
 GYHRG4kJSv3nDx67pLH9F6xluQ==
X-Google-Smtp-Source: ABdhPJykXwgfRCKGkCuVBJeSY0VhHwM7sD5T76btWyUDPDnvqs5mas5MCgsumMZpkPhC/MOVk93Pkw==
X-Received: by 2002:a05:620a:2295:: with SMTP id
 o21mr447304qkh.349.1614798572949; 
 Wed, 03 Mar 2021 11:09:32 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-451a-3a99-8647-33ef.res6.spectrum.com.
 [2603:6081:7b07:927a:451a:3a99:8647:33ef])
 by smtp.gmail.com with ESMTPSA id 90sm16001328qtc.86.2021.03.03.11.09.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Mar 2021 11:09:32 -0800 (PST)
Date: Wed, 3 Mar 2021 14:09:30 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210303190930.GT1310@bill-the-cat>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
 <20210205135332.7.Ib32061f8d5bd96afb1a641107fef22ae96e05280@changeid>
MIME-Version: 1.0
In-Reply-To: <20210205135332.7.Ib32061f8d5bd96afb1a641107fef22ae96e05280@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Masahiro Yamada <masahiroy@kernel.org>, Ovidiu Panait <ovpanait@gmail.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH 7/8] arm: cp15: remove weak function
	arm_init_domains
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
Content-Type: multipart/mixed; boundary="===============1147248502187528205=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1147248502187528205==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yypaS3FvPkEUiGyo"
Content-Disposition: inline


--yypaS3FvPkEUiGyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 01:53:38PM +0100, Patrick Delaunay wrote:

> Remove the unused weak function arm_init_domains used to change the
> DACR value.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--yypaS3FvPkEUiGyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA/3uoACgkQFHw5/5Y0
tyzrvQwAmTUnAdenjQmcXTdXX3qL/ScqN5Mnn91iTSk4VTB8cR3vPOrK5z0s81ff
EvOJBXgBQqA1VsIUTb1P31Dbh5honb9nDo39NK2cnmJP+phGTR66hj+y1Jk9IT5Z
2OSskW5tr5UmTNEh+u81EBGPnHGcRv8iBN84mPS+ZJf1riRfHBYrav9X8lPipc43
3kQiLiFzcMWFHyOqXS5WFzS5MMhd01JfJ6XeAhRdXsILh5G3eeOvMdsSYPSb1fii
ZM6FQFc21f+BpLwdWx/5xajIZr+GomXlEOh8oBdA/sZ3TK08muZjcd7lCvHGs1sH
xvWhrl/oM8Esk3SKCL/vXGa/u7x05cvTBVy83hhy1W9A1cbEsWBEmYeuq2xmJaU5
KMMTFL5BNDITvOKxixcxXeIqILcRG6gHNuGm51DJxGved7cBsPr3UYR5qrZK5C0C
CvH0/+BTpmm+QZyeIY5A6kvB84TZV6E9R8rJU6lRHCVe/FvH3Vv52z8oYiZIOy0m
CU0zxALC
=QfLL
-----END PGP SIGNATURE-----

--yypaS3FvPkEUiGyo--

--===============1147248502187528205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1147248502187528205==--
