Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D462724A4
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jul 2019 04:29:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B3E7CFAC67
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jul 2019 02:29:26 +0000 (UTC)
Received: from mail-yw1-f42.google.com (mail-yw1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A123CFAC66
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 02:29:25 +0000 (UTC)
Received: by mail-yw1-f42.google.com with SMTP id m16so17624194ywh.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2019 19:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c1na48979Q0hVBCLgdClql66GzCxT6fi7s1MXjLZBd0=;
 b=q1BA53yQxjLCLtGVXcDnyYlQRaiqVvkn//dFR5xclwQeSAqhT/sz4J+ItawB9s3W1Y
 Rn+h/CHHzDmyKr8h8KlclV8kefyWdoBAVEr1cPnaxzZQT0VwcYvC8uAkjQU0MNm2Mm/4
 9BtXfh2Laa9GF5IaY87cLxyt9pMQiTXzkPNT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c1na48979Q0hVBCLgdClql66GzCxT6fi7s1MXjLZBd0=;
 b=ntg+9w/9Ci2cI4uPXWAHblqWQ/BLo4JD6XddfAKheFnj4z/JjUTr0A5eydMJnq6NvP
 WovpigM2RY/4vO5LnhqPb2PuHjVbMhyZGDKLbl/xYn81UBq4OxOQVGfZopTWRb6PsdaK
 2Cuxv+ffwjGOd+zdyiCbXdPRCsz+a7i/nOUamSF8dtiozkf4X5mpImN3bjCbKBzE32oK
 ETYyuubJCuGPAB58UPVdF6B6h9yoToR6YoSMYEBGC/nLk4ry6KdRU47ubotaY6D/dFcY
 nKpBFxZXSj1fagNrUg6H7Y14CL9HxQezC2UyzsoxZ+cVQNPTHunUqltepfU4oRwcw1HE
 bnEw==
X-Gm-Message-State: APjAAAWNVHo0ssZnAynly+ndml1EyJ6ORQ/tzlSiswg/hwWHL9nvcko4
 BITsaOrRhxBUazWHLoEuww8=
X-Google-Smtp-Source: APXvYqz4j8IjGxETaRa6FpFI6aTI6UizkGDqTMHSLjtPdbdEzRqX5wsQI7C6RBq2s6SNTej4a+LQJg==
X-Received: by 2002:a0d:c9c1:: with SMTP id
 l184mr46001560ywd.501.1563935364235; 
 Tue, 23 Jul 2019 19:29:24 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82DE-6132-7A06-8704-980.dyn6.twc.com.
 [2606:a000:1401:82de:6132:7a06:8704:980])
 by smtp.gmail.com with ESMTPSA id j8sm10271135ywa.62.2019.07.23.19.29.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 19:29:23 -0700 (PDT)
Date: Tue, 23 Jul 2019 22:29:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20190724022920.GW20116@bill-the-cat>
References: <9e663e333ec0431793ca5d2a5d20c659@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <9e663e333ec0431793ca5d2a5d20c659@SFHDAG6NODE3.st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] u-boot-stm32/master for v2019.10-rc1:
 u-boot-stm32-20190723
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
Content-Type: multipart/mixed; boundary="===============1641490354932152083=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1641490354932152083==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a+XGtYJu0T/hLQIy"
Content-Disposition: inline


--a+XGtYJu0T/hLQIy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2019 at 07:20:49AM +0000, Patrick DELAUNAY wrote:

>=20
> Hi Tom
>=20
> please pull the STM32 related patches for v2019.10-rc1 =3D u-boot-stm32-2=
0190723
>=20
> Travis CI status:
> 	https://travis-ci.org/patrickdelaunay/u-boot/builds/562084625
> 	the warnings are not related to the patchsets.
>=20
> Thanks,
> Patrick
>=20
> The following changes since commit 0de815356474912ef5bef9a69f0327a5a93bb2=
c2:
>=20
>   Merge branch '2019-07-17-master-imports' (2019-07-18 11:31:37 -0400)
>=20
> are available in the git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20190723
>=20
> for you to fetch changes up to 1f99eaff08f699472860c82480344e824a737d57:
>=20
>   rtc: Add rtc driver for stm32mp1 (2019-07-22 11:04:52 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--a+XGtYJu0T/hLQIy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdN8KAAAoJEIf59jXTHXZSM7UP/2de4Rhew8A39axrAfteezis
lqrnBGX5JESo9q3OuQH0PehYDwBPXfIoanNeYoYD1BEaDn2LD13YItGEPPs3Z1R5
UNxgPtWKMiCbI85qq8l7KY6WdbopyXJM3N7PzFYLWd3WqgLKksT91vKbXCYnZPpr
2clDoat6DCgB4fFZ/GlAPwNnskXTybXS4pZIAOdVVj/aqG3Uv3k1VmAiGlDFZ8Yy
5eCrYP+Cz0aE760uyE6/e1XTFBfArlw6sWK5FiP3yaP57TuBATvupOTjb/DNPbv+
TWkeefWAuoI90a1at5j+sRogRgQpYfqhK7ll9CzE3b2L1yOrC4M4YFsDxcfA9Z7B
fwvl0l+a3FpN2j0Oaq1n/bJYB6DKYEOy0n/9N4CGiXbDNfouStZYJRO68+RHZizp
eIdM9CDkeyEGI+YH9v3kAljB4DNboSfTsH5fOPALaGXq338NrdFqBoQUFYZGgQny
GU9nzQamvMiWRCw5EF8wgcAKhKBRu94aIbsAkyVwpRBmLIt6z2vhEzbmglhtHBSb
dANi6xJ3IzwUiyCgc4hk0QBkT5TjqtI6LC4hGwSgHF4PH2mZJM2oHCm0uPc05CGh
Yl21Lz5Idqbc2yakeXvbyVa6ap8sQQYOq/yIcuBn3LkFIh2a/7BCeSgO8VuNW1fW
BgjX/R/KwyLBMTXIOAdu
=uJm6
-----END PGP SIGNATURE-----

--a+XGtYJu0T/hLQIy--

--===============1641490354932152083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1641490354932152083==--
