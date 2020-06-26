Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AED20BAB4
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 22:55:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F736C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 20:55:09 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87886C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 20:55:08 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d27so8526205qtg.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 13:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ebBzUjTl3CgtXfkxhOYqEAmDdkyS1G9G8R/Gxvsmu5U=;
 b=JqVkb5rl2Kij3is+mIH0vxXV8B9wcqqNHYyOEWz8R2gCC0tGjVp5HjFj5cVfhoWTwb
 9F5c9mJCNqztv6jKd0rPh9j+e4fwvS9wwog/Phu4t1IbYAb7QS83zLr7b04MFfLzMpTD
 rCn0ySuFqqptEqwF/z8qm353N2CLmxcSC956M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ebBzUjTl3CgtXfkxhOYqEAmDdkyS1G9G8R/Gxvsmu5U=;
 b=DgGaWIgK5Ly0RSLvcQfQQrQQzJfcRB7VVR/UHi5wSxKAYvl0zaZyb2/uKbecO8MpKM
 bbSSElPGvSvI2JKmV6ag4E5P+dj4a/QlwQP7UgvVUqzqfKICo06i/P4RvrtwHSckjoHj
 2SBxpJGjC6DBz7ptlqX8qzpP1ceWr/RX1qI7Zc+L62Exo5UXZQ89cdfXn2Aq8CE/5tiH
 fCUJ5Zcn83dYurpWx1frz9WiTE8U9qEqdoINjbSRGw6DaCJ98G+4ZvMuPicuwf6EbR3P
 9rr6+k9eO93J4f38qFfmyLp5jp3VLsaOTA4h1xFPHZgE9Ejtty/7uTwZpUvoUgnA+F4B
 HMJQ==
X-Gm-Message-State: AOAM530mWSMN3p7aHbfX/1zxTe6C6jC+DFxutDuWMIPE1lZ2vhCyOuz+
 4Bf06FTyGIxBZ4HGavUKncDiWA==
X-Google-Smtp-Source: ABdhPJxhJAoSGKDxMMeHYlgXCYQjIDifWccAYePR41bDrt2sLbLPJQ5KE6A5xL5CyBLPIVTWG5WHSA==
X-Received: by 2002:aed:204e:: with SMTP id 72mr4645610qta.313.1593204907477; 
 Fri, 26 Jun 2020 13:55:07 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-bd3e-bf60-4b70-2dd4.inf6.spectrum.com.
 [2606:a000:1401:8080:bd3e:bf60:4b70:2dd4])
 by smtp.gmail.com with ESMTPSA id 15sm5781131qkm.93.2020.06.26.13.55.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Jun 2020 13:55:06 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:04 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200626205504.GG8432@bill-the-cat>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
 <20200625075958.9868-5-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200625075958.9868-5-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 04/14] env: correctly handle
	env_load_prio
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
Content-Type: multipart/mixed; boundary="===============4215517299495462404=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4215517299495462404==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xd7ZVmXU2EjaW0+X"
Content-Disposition: inline


--xd7ZVmXU2EjaW0+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 09:59:48AM +0200, Patrick Delaunay wrote:

> Only update gd->env_load_prio in generic function env_load()
> and no more in the weak function env_get_location() which is
> called in many place (for example in env_driver_lookup, even
> for ENVOP_SAVE operation).
>=20
> This patch is a preliminary step to use env_driver_lookup()/
> env_get_location() in new function env_select() without
> updating gd->env_load_prio.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--xd7ZVmXU2EjaW0+X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl72YKgACgkQFHw5/5Y0
tyymHAwApNORo0Q3hGk0iwYxN47KbH/GzU85up/tQ+XhyftwlMg5p3VnMCQJUALo
9QjFvW9RfI6vVgK6NhX4YwzjcJgEs5+CSwEFJvJbNgmaRexd7O0W+KnKzhGmPIZa
CfJWqQFs4S3U44oI9NrUdIPLXXL/Cs8PEBBJIcXvmMgpiz2MeQBowvLVBgnd4tsj
ALT1u07Aw0Ox7P1Y65Dj72nU3V8Iaumi27RblAgswk76CCaBzKB73jqwQ/4OKLzD
J7hvkvI8Vo/E0XScFdRzbIZ6fjIqrUFvEhYmeK+e/rd1v8Oyz5IFE6UBf2XrgYE8
pN1Cv+Pg6528IqCZdF4Yfw33bf3/ENZaLxdIQE+pkOEgk3y7mhutAgdBZf3deGb5
jx7vsN5LmiygKQG8CtH5gjCrTHG6ssXeF9cNAiEiy3juXBHAfT9bAF7PT/SGg57i
nhlhpusr2fjUP1d/tWTc6Mv1ZBK/5K4uXmTqMwbg9sIzxEW+R9iL8/PXJ15kUo1R
AifImf9E
=iIom
-----END PGP SIGNATURE-----

--xd7ZVmXU2EjaW0+X--

--===============4215517299495462404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4215517299495462404==--
