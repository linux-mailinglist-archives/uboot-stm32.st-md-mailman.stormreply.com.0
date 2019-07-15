Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F2E68B96
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jul 2019 15:42:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6C60C5C802
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jul 2019 13:42:23 +0000 (UTC)
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com
 [209.85.161.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9074EC5C21A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2019 13:42:22 +0000 (UTC)
Received: by mail-yw1-f53.google.com with SMTP id b143so7355244ywb.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2019 06:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OxSt3qWJXNoKaskYEyzstKLyRC1kZnO/wLszlv8qEZc=;
 b=CLnuAb3DRuTtcmVTN31WgN8q4Tv8D+0OTwKPah+kXDoIuwj4NP8IDauQFvC6zHWxsb
 HZQc+qPAdtgc8ZC/kQuIHWQHH8k68K3j1xm8yoYGqQWUP1zTSV0QE0xAOh4Vdnn9kL9P
 1XlIrOFAhZLfHsrg367n+Ct6RRLKZ1KOClJ8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OxSt3qWJXNoKaskYEyzstKLyRC1kZnO/wLszlv8qEZc=;
 b=D/HHPFLTtx0ccEqWIlob3Vqm3imTV88E3Y6oYx6QzJUKNUI+oNQWabr5KDTC3X7Fzx
 3n2QEm8T+BnHxnBfXhy6rRCjjgm4ziBzL50jK0GKiqDR7SgejeGqY9RFS6h0A0dYc9Wn
 ZgPEKGYnxZmkiBw0V+SpCkXQCsVGKUcMneQRvRen2pomBJs/ZtS00UnaF7oUs6uzHI13
 OcrSRPjrZe1dWSn4lN2fm1Laa+TePUmj/G0c+ikpN+ZMmIxPbs4nfswcQFSiJ4cYSVzs
 kAQrt8qelp+HwoPRgEZwSceO1tbS/acaMxmHIRo7Jy9hO1gYoNxjHBY1U8ytLXTeCD8p
 chrw==
X-Gm-Message-State: APjAAAUqt5L/tCUBb0NThp2LzGV2IdXXiO8vjTbYN83KhNRCv0xZrB/Q
 6tfR/1qVCvOQkiH+t7LSna8=
X-Google-Smtp-Source: APXvYqwJMsAqeYIPfaFsfpTnVEyF0rm/khsFJAFwzjNDXFyjDfPO7iAZ9uESkCUC0ytWY+3KVaKUHA==
X-Received: by 2002:a81:4ed3:: with SMTP id
 c202mr15318546ywb.355.1563198141397; 
 Mon, 15 Jul 2019 06:42:21 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82DE-2C78-C450-AA66-877B.dyn6.twc.com.
 [2606:a000:1401:82de:2c78:c450:aa66:877b])
 by smtp.gmail.com with ESMTPSA id 82sm4331277ywr.52.2019.07.15.06.42.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 06:42:20 -0700 (PDT)
Date: Mon, 15 Jul 2019 09:42:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20190715134218.GN5621@bill-the-cat>
References: <431c6ea182f54552a77b89282cf6284b@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <431c6ea182f54552a77b89282cf6284b@SFHDAG6NODE3.st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] u-boot-stm32/master for v2019.10-rc1:
 u-boot-stm32-20190712
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
Content-Type: multipart/mixed; boundary="===============1734632222691991596=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1734632222691991596==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g/o8sqaH6XVFI89B"
Content-Disposition: inline


--g/o8sqaH6XVFI89B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2019 at 04:04:05PM +0000, Patrick DELAUNAY wrote:

> Hi Tom
>=20
> please pull the STM32 related patches for v2019.10-rc1 =3D u-boot-stm32-2=
0190712
>=20
> Travis CI status:
> 	https://travis-ci.org/patrickdelaunay/u-boot/builds/557765098
> 	the 4 issues are not related to the patchsets : test_ut[ut_dm_pci_ep_bas=
e]
>=20
> Thanks,
> Patrick
>=20
>=20
> The following changes since commit 5acce685c9227b3d4b48f6fab6a33f6d74ca9c=
14:
>=20
>   Merge branch '2019-07-11-master-imports' (2019-07-11 18:03:52 -0400)
>=20
> are available in the git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20190712
>=20
> for you to fetch changes up to 291f00bb3ea7e9f9acdddbe680991e76313732d6:
>=20
>   board: st: add missing gpio_request() for stm32f429-discovery (2019-07-=
12 11:50:58 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--g/o8sqaH6XVFI89B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdLIK6AAoJEIf59jXTHXZSJe4QALbvYXqbYbbMZjbvGqzrVssc
PVdaU+ZMyIkhVlZ31NduTYBpC30TAahXjkQz+uTFKsdedeJIvoA5BTKBa2HD6Y/x
ehJOeeVd0Ec/dcGdfsOS10k6NeHjnGlasmBH3wQlQtpxEjjEz2KOaNl4bG2++TZr
APZueAYcRCkyzpr9hPLrHtANPmb6FZtHYnWauISDB6ukLviACrnzXAo4o72oTYhs
n9DxBxhBN9qxz4DNPH6vmVWZbgqdx4+SbU/SOZhbwYaT4ooGa3WZ3v2Sjwcum0xV
Oz+W8ceLge0aiRIFjfXvvRGoO67qVn8tF8mkBeweAIqXd5skR8F9+gi55jK9iLuu
UHAkl/IKB8uNuz5FsPwXSnS+NIFvdSdCXm5coFKr++dxyxRuradW4MGeF2FkTzD5
Z4EnH8C4bZE9iCM03tFYEBu5oDLtEr3NA5OU+JX3gKNTVroSmbJML+BYhNpKa54O
Qw1XECLyZRyA5Ljy82VeY0Wsddue3OLwe797PaodKECWK3hRb2rwak3VquulEUwW
e9fjCmxFjX8B/UPiSJo+eDUQqnhSDuLGTkqslope8NEAZ5me/WzFv8zwuuoVYpxX
5uyUVenoAjtVDjqK4V7KDu2BjhBdcoyR39llrJSrtlYO07UsO81w4AgnW6MWC8iS
si7pMR8cPZ9cKVD0YaVm
=7zCW
-----END PGP SIGNATURE-----

--g/o8sqaH6XVFI89B--

--===============1734632222691991596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1734632222691991596==--
