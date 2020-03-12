Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED3183B9F
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Mar 2020 22:46:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C58BEC36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Mar 2020 21:46:08 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E5EDC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2020 21:46:07 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id r15so3481853qve.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2020 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JPhc80j0ummMne9UmO7cL9bdN1wZb8RDSxzNdkkjD+k=;
 b=ogkZ6LGFSpQovztX9an8D/UE7zNf+jumbszrKnOgrTafqMwKRya5FSs2vTIx4JcwMf
 H19m6ArCADorWUZEyKoCtYYVXuupHrsg2U2q35rj+8Ob5Kxde8zwA1lDZEK5Y4x0gbH6
 GOHnow3LJGFWBmIIBmaN0apiFNPSoCB0MXxWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JPhc80j0ummMne9UmO7cL9bdN1wZb8RDSxzNdkkjD+k=;
 b=pHy8U93+Dm22cgb81BJbZCJ8zuj8Ls7u44FRhs+Now5LmmbpRIX7n9AoqmTOedJmzz
 jjtrJT1O+tHo3bszTMJsJbkrWkpWE43nv4MR4o5kKw/5VtPQkmYxMeMm5EOYdJTa+OVD
 dnrxnIIx/Mh5nnvCCk4S7r4mnk4jZpVW5nfZ2ArI0MA7PinwCDqtLIF9yoZyNyYsOkJU
 TmC+c+VVuPuc+izOMkbWAGjcIsQhg/cMM3Om7j6YN2SvxC4IE3N/Zlrh11D7p0IQ/CHG
 OULGrOHYCpRrVmc4zHA4DaZoOy7xzPm7XQZX20IrKCM/iyiELd7ZnCg20OGIpjt0V1D9
 p4lg==
X-Gm-Message-State: ANhLgQ1HBTB/xQHBG3rTge8TTc3OUIyT8PvZskbM/zH57zZ6NHqMmYri
 OigfrsbCall5bX3Y9knqMm03uQ==
X-Google-Smtp-Source: ADFU+vsX0N81NJHyoaT9x9sfdBIVF7g9VqkJDcEPwM0vmm80ZBqNOH7ymmUMjQ1Hv6D7roPfUwW/wQ==
X-Received: by 2002:a05:6214:a73:: with SMTP id
 ef19mr3872752qvb.98.1584049565710; 
 Thu, 12 Mar 2020 14:46:05 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c31-2dbb-1704-24ca-48e5.inf6.spectrum.com.
 [2606:a000:1401:8c31:2dbb:1704:24ca:48e5])
 by smtp.gmail.com with ESMTPSA id i4sm28482259qkf.111.2020.03.12.14.46.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 14:46:04 -0700 (PDT)
Date: Thu, 12 Mar 2020 17:46:01 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200312214601.GA12423@bill-the-cat>
References: <bd0e30dec781493d9797eea097bff7e0@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <bd0e30dec781493d9797eea097bff7e0@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm32
	=u-boot-stm32-20200310
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
Content-Type: multipart/mixed; boundary="===============7270438637960988454=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7270438637960988454==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xyF51EaUT3XiWnZP"
Content-Disposition: inline


--xyF51EaUT3XiWnZP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 08:21:53AM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related fixes for v2020.04-rc4 =3D u-boot-stm32-202=
00310
>=20
> With the following changes:
> - stm32mp: fix dependency for CONFIG_STM32_ETZPC
>=20
> CI status:
>      https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2399
>=20
> Thanks,
> Patrick
>=20
> The following changes since commit 9f976bac2b4a81a13de8124a896a198cbeabb6=
34:
>=20
>   Merge https://gitlab.denx.de/u-boot/custodians/u-boot-x86 (2020-03-05 0=
7:51:12 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20200310
>=20
> for you to fetch changes up to 7a02e4d53c4a44a565cc9228bd1b78e0a2bdd6b5:
>=20
>   stm32mp: update dependency for STM32_ETZPC (2020-03-10 18:11:02 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--xyF51EaUT3XiWnZP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl5qrZYACgkQFHw5/5Y0
tyw/Sgv/XG+oM7T9HmhlOGKtoDzp9vEgnIaCBQPuuoWmN2A4wEKhi3HokX3M83HI
CZ3r7a8RDsU5W6H4NEDdMOwIY51M0bhP2KNzONfxFdx8N1QVJMFjgU7p0uEm+kUq
5ZsuPAJsIJ7+nDy2OV3Sz78avGxNp/YYnFO+7dfLniN0Oz3borjo1p+9iRbKf+O1
ZixrWYnOnb96Ou5lXctnPAyn/ALq6KqILaByRVpW1m92aF4IBaqUZlsnXIL8Rjmy
iE58FX83pQSQokWAvBYwjLwzE2/mfWXf32Cs8b+ZKuOCCpQqg4CM91szGN/wdRE4
kj65Q7g1UMwcVrCbeuUTxaOPpjDKIFPsPzpYYmBgv0QUWa0FB5g8hykj//xDiCax
M2meDU1v3Ygx+hggIOerXJTUZw2yemzCteCb4r8LSVVdZu79eQLE4BCPYQCtus0Z
HvfCqqWbdyegLp7AAtDQnBSrAohRatq5vXrS/FTd9mRA+1XSPEj7JsYuOaKvO3vV
bo8zx3CC
=e06S
-----END PGP SIGNATURE-----

--xyF51EaUT3XiWnZP--

--===============7270438637960988454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7270438637960988454==--
