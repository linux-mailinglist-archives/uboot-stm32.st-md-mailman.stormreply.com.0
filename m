Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFBD13390
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 May 2019 20:20:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6781BC5AB7C
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 May 2019 18:20:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E91FFC5AB7B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2019 18:20:12 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k16so8982250wrn.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 May 2019 11:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oE/1otMG/P2GoaFb/y2ZS61STKOFQoGC3yFvhYQ9Jc0=;
 b=iNaqFDxdR5GBAOlvOEIsL3lpgj0WMKNi4jD7+wy0+QOXXNUv3T1zonOsWWUruUJz1O
 nGe+0MS4d3tWRR65/4eEMAJCxmDxzcIpNLAlf4ILFOOik+44+8IM4Le7k4s+HJVl2+Jr
 /ung6ZxRJrDNmP1DnkEBqwwWUi5tQ4d9gbNDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oE/1otMG/P2GoaFb/y2ZS61STKOFQoGC3yFvhYQ9Jc0=;
 b=eoIsVbvfxkKg/a+Rcv28oMJ1Wg0NherayZQ+vJeKY1MK51Ek57RE0+wu8ui1rW/1T5
 CkDq1EMdUfp2ORDGsukQY+YY12niBfq6YC9fl5ThQelxG2XIN4a58++XaZMw1gltREsd
 0Kc1kVAmS2HacTDz87X30TJ8jNYpsu99JuCUehdkJAsXvmK6hJGQeAT7i+QsNBkv9Bsz
 aPERn6s8yXmaP18/JjuDepOYXRR3Z/2vA/f/gbu9VRhhbhjjwPM5qkzoAeeI0JBnOom9
 zlpKzLEtzodZ2cras1h5kQv+YlPlseCqdNEWX4+Th/IzhoTaPNcUMlKQU12ZasPI7Oey
 /CPQ==
X-Gm-Message-State: APjAAAUCm9vtKhWXa7SvdMsTIymA2D3DZR+6zWttVNYt4v8MBxnmn4wI
 RJAwmQZob/UVrP/0h65RSzIpcw==
X-Google-Smtp-Source: APXvYqxVrWLtDNhSaatrOy+Jj/7ZrPaqDJ7IKEh5lgJlNG32YFyFBi9qA2d3/CXie67jhw5vNIAbxg==
X-Received: by 2002:a5d:434c:: with SMTP id u12mr1983864wrr.92.1556907612524; 
 Fri, 03 May 2019 11:20:12 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
 [65.184.141.147])
 by smtp.gmail.com with ESMTPSA id s16sm3232953wrg.71.2019.05.03.11.20.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 11:20:11 -0700 (PDT)
Date: Fri, 3 May 2019 14:20:08 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20190503182008.GG31207@bill-the-cat>
References: <1556189848-11837-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <1556189848-11837-1-git-send-email-patrice.chotard@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, sr@denx.de
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] watchdog: Kconfig: update WDT
	help message
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
Content-Type: multipart/mixed; boundary="===============4647637926853832618=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4647637926853832618==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GAzpPYyT+RJB+LUR"
Content-Disposition: inline


--GAzpPYyT+RJB+LUR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2019 at 12:57:28PM +0200, Patrice Chotard wrote:

> Restart operation never exists and reset operation never
> makes the watchdog expire immediately but expire_now operation
> does.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Reviewed-by: Stefan Roese <sr@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--GAzpPYyT+RJB+LUR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJczIZXAAoJEIf59jXTHXZS0vIQAJiGvX2wu8x1MhcPeHH8gZOK
QzXOiqzU4UF9XDPfsjJq54YyeQYlXmAcDuTGncGbWHXnexGGKdXkbFBJS2Kn2pZT
IHi8qfPmvJA4tqNVkBa/DWgjDPAbafFjdMFxbjHXdMb+P5eOwCT4tGS2XJArFzVB
myUFY3BGLvnw/QDSRHTjLrw1Q6smVJ2zkO0T2TAcGDRItW338m0zciSriQNFjCvz
x7CEG5TLlzygMr/3uTp8W9xOGcc3Wn0mXSBHvqayZxKCL1xcfcSb13Hl2erAogwC
VqtkDoNFDnm8GSVl/a4Cq/piU7uHEEDkxdTDatmqyDQiIiaFyjXoxsnWOF29BYEO
qe4fuCrgYC+QbLJ13/DzL1G8pnDbkyjThJ7PcmrFSyB/aP4q6sqWlSTwZjGqQjIF
pLwUHWTuBftPxVX2od5y26SdvyDzTQVc1l8p1cOT3xXV3++GsAhNnCBDiHbO7+3E
0DBZ2BU0XFas44X/lZeEzETgh2LEkMs350X7RjiXd/x5NA0lwy0iCqiKGI9SWMuE
DOkj/GHWZIGaVJHlZQJucpr3t4G5RJvFwwBj+TVtknD3E8rMjUDU9YQApCbrfQME
4ZbfaT8SsT9wF3vNXTOXRJ+sXq/UNww7vl00wYeR9+tKyHB+WwGXc5+2Ontq6GxG
6cVI2UC2Cqxby/uam8Ii
=kekg
-----END PGP SIGNATURE-----

--GAzpPYyT+RJB+LUR--

--===============4647637926853832618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4647637926853832618==--
