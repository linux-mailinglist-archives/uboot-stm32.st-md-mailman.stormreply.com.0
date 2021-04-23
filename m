Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7753696D8
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Apr 2021 18:24:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92327C57B5A;
	Fri, 23 Apr 2021 16:24:30 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 787B7C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 16:24:28 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id a18so13016061qtj.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K3kgSfZM/kJdKpBJVRvWsan8UNs2dfChn1fipsTL3r4=;
 b=YJXmr0a4BuAgh9ErvwW8aLzxzykIQAvjY4IRtZYvTWPeg91unxCnhXZU7C5QGR8rvG
 hptXMrm9sZMtytnA1unKeg600SqJxG71RxpxadI/JYDoTaAAKX+ua5E9KhUFG2oRoCip
 PGaE7q7os8gr1hMk3lDLddnQjUPT0UdavBw8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K3kgSfZM/kJdKpBJVRvWsan8UNs2dfChn1fipsTL3r4=;
 b=nHw246bcGIPJAo7q+p1HygQ4JoYo0iokbCTJL8wsmf+j532fiqfnYJrAF0TY0Gb0UU
 z8dXNpZ3wK9+CB1JI5aHuOWHHJuARQDIYmRbRKA3OZmFzpTgqrrfnzx9h9pdot+0nNsH
 TOF/DdPLb8H6bqP/KnuZX7giZlxS4J83IQemFCo+LbVGLYc6NVnVIIYQ0ow0sfeqpEUM
 W5lFdX8aGh8G6/MyJDwydPsDOUiXyHCGjiiPBF7J1Ut3ER++Bll7QfCjijl89EIglul1
 MGaGFnCB8Or1lZBoQVKIEihUVF8c0ElAoJhdjKBnbAjka7YccnNz49Pr6OZ8Fl8swuhk
 dzOA==
X-Gm-Message-State: AOAM533wJM3Ja3cdWAVyDPVwG6rOP2qPbKYS2+w+hi7ORUBYG/4AB4Ux
 LKS0hvJ63rXxU0/W0rKJHenj9A==
X-Google-Smtp-Source: ABdhPJwMZmny2Sx+Atfxlkk3JGpEfFkOtuCEIHaJ2O8FWFR3CQ0T9go463fAz+QaH/idaENx+C6w6g==
X-Received: by 2002:ac8:7dc3:: with SMTP id c3mr4476890qte.229.1619195067484; 
 Fri, 23 Apr 2021 09:24:27 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id f7sm4722429qtv.53.2021.04.23.09.24.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Apr 2021 09:24:26 -0700 (PDT)
Date: Fri, 23 Apr 2021 12:24:25 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210423162425.GU1310@bill-the-cat>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
 <20210310101622.v2.8.I0fd0759810c8b211efa5597dd4333772abcde528@changeid>
MIME-Version: 1.0
In-Reply-To: <20210310101622.v2.8.I0fd0759810c8b211efa5597dd4333772abcde528@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 8/8] configs: stm32mp15: increase the
 number of reserved memory region in lmb
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
Content-Type: multipart/mixed; boundary="===============3363422879466363823=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3363422879466363823==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DuLvhqnec9YPWr8c"
Content-Disposition: inline


--DuLvhqnec9YPWr8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 10:16:32AM +0100, Patrick Delaunay wrote:

> For the latest kernel device tree the max number of reserved regions
> in lmb library is reached: 8 with 5 reserved regions in device tree.
>=20
> When a new region is added, the lmb allocation for the device tree
> relocation failed and boot with ramdisk failed.
>=20
> This patch avoids this issue by increasing the max number of
> supported reserved memory in lmb library to 16.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--DuLvhqnec9YPWr8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmCC9LgACgkQFHw5/5Y0
tyyQwAv/ScGF8y5Tv0Q/h342iTbY+NVIjLgE0FhJW0UZa6glk3X6x8Mr14S6Kupr
8VXcVtZ68g0UWk7/bLLSZcMyuLFtzF0JHVgjyJ96+NM7+vbGsCUeJV94A79v92rB
tQKogVxjZRRhwOt5C9eWmRExjKmhWmVP7434S67abXYjUF4pP+g9zJkCoiopUzl+
q7Wxt0lkRsaZIsEyyhCcs319k652KyGc3fPO3nEdcCmxhW1VHgjeo1fsrY6hY6Fr
xRAVsp3heRwmXJ6lJX3a4hWAi0ystp/SuiZkLdHFzI+6FC5V+1e3wA5yZGl6fJ6p
hZAodUBd28j6zMRGOv+YTgsNQJU71dkpStNlPHqog1QNgh7KZVrR8vbpy1d7I91i
1jj+Cst4czN10xTvBQwv7AcQNLWPvcbj7iruiPx0OvsPi0/yKFwLUh96r/eCMFBh
csgGJ1eQ/GuF0N56JoJ/xdxq9IrEqDP36/CS/iiKPsZm9/4jdBgvclrKr7Enb9Lr
VZv5S7AK
=/gBy
-----END PGP SIGNATURE-----

--DuLvhqnec9YPWr8c--

--===============3363422879466363823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3363422879466363823==--
