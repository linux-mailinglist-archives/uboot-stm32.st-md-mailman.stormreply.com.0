Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 766591AE72A
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EA7BC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:34 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5EEAC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:06:32 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l13so3213422qtr.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4Ii+Lc4MM4PNPDN7FEhKCOpVUEceuDZkDjWYAELKC60=;
 b=ik3vfSmKIgy9lFHVBBCE5NWTCfA0FZO4LCqak8WS7VVYUCrWWjEjwAHfmr6n0y8rMO
 XWW4WlIJ84RgkHZo6Va5AX78Yt4SmqbybWQHbvXJUqM6ppyZ1acxYDfg6rTGOVmfCFSC
 vijQPmxibWHcP3PxHAS4I8FGU6TOjCrq+Fna4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4Ii+Lc4MM4PNPDN7FEhKCOpVUEceuDZkDjWYAELKC60=;
 b=i+y89fYV+grSG9Mr+xPy6NpXF6KQChSUNyah7Kw1hA1KtKzOcYptZ2srwMqTZM/I3k
 EFL339bTf40xXVjiPfBw10gru0LvReGfWH21qzInyFBsTf6gy9/bI0CuSRlgqpS38vnS
 WCOg7yLk/jI0mOZd5R2M+aXsI9Zrp7pTeS4jb2fUA+eeLHXvrqd/JnaSt0pqBK8IkfmS
 fmoZ9owCghlZHndikQA4simTAYAaIfKHhzRcWwpDDWhUQoyLDaAf0YeiYB/Cvdwe5UAc
 zXCEJX49a9EqpAA8tOJhSMpI2hb6DVffL/NxxYdSnxiI923ewRtEdqQTvLWbIpe6VRoO
 Ao1A==
X-Gm-Message-State: AGi0PuZZjVoHwE8FPJP7w2ihpEQUC/MFossS7DMHNHjeAAiylxIfTeXL
 NJKeXp8NGKHgrjG+hYNWS9WdxQ==
X-Google-Smtp-Source: APiQypL4NhN+dPen8n6fl+VFpBmSfLlGu0pL6Ew5zVMS24q83l/aLtjd0CaSidXVRxIH7+2IsXpq0w==
X-Received: by 2002:ac8:7552:: with SMTP id b18mr4838272qtr.312.1587157591858; 
 Fri, 17 Apr 2020 14:06:31 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id m12sm17008962qki.75.2020.04.17.14.06.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:06:31 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:29 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210629.GO4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-9-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-9-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 08/21] gpio: add function
	_gpio_get_value
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
Content-Type: multipart/mixed; boundary="===============6222919061611412398=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6222919061611412398==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KjX7LgAomYr70Ka9"
Content-Disposition: inline


--KjX7LgAomYr70Ka9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:02AM +0100, Patrick Delaunay wrote:

> Introduce the function _gpio_get_value to get the GPIO value
> without check if it is reserved.
> This patch prepare new ops introduction.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--KjX7LgAomYr70Ka9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGlQACgkQFHw5/5Y0
tywh1QwAnhOEv933zYmFaWVSav7Chi0nj38x9+VD+e/JLxvySiVqs8xxWjwBchAK
QQQTKnk0mNzql4z9Qtgg4hkRvMfpMsFqkSMvIBiqW1d3x41WElx5lLgTNQ+limlx
HNVjQtD9uMECxppYbMTs9SqMQ/+2YkHTCRq4CClu+qSBPZOeXM2iEMF+58KBOjfL
uFDZfRMZfju2mH4Qkhjg8PerI4aaXKCj/tEpx/oK9xB83wVfJvwIlOdZXctKN7t4
JOZLMOSSZtKibC47Fgkkgu6Ry7usZ/RTCkNrqjfuS7RlmUge1LAAb8WyYEptW0p7
j/+1px/CvStYPmS9R0ylnx6lw/0VEuvTttVGq1XvlXzC49iO9ZJ8Df8ZQxMylIH6
vb3Qn8m6STkz4d6X+lIeJvejXNNI4ihG1QSIHOovo6M70hgACORGaWPxl/2GbtSX
xL1cqnhrEHnoAgklxbb8o0Rj7n6/aD++IVxh1fVJo+QdKOGiqodzDvIifGRHEvuh
ShF4HVdt
=5CVd
-----END PGP SIGNATURE-----

--KjX7LgAomYr70Ka9--

--===============6222919061611412398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6222919061611412398==--
