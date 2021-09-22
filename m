Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F22414AAF
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 15:39:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE33FC5A4CD;
	Wed, 22 Sep 2021 13:39:34 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36342C5A4CE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 13:39:32 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id w17so2627885qta.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Md81JeCJhqd+EeMrbGWNw/nR06kVqy2oVh9RDHN4nQM=;
 b=eeWtyaJGbcGBSunDTK/a+C08krxMh8GUfd2E+WdtfLgMiMP1JlIqCEMkpgXlne2oRh
 8Hl3WImkfezVjH9NsmjjV/rS3PgFKCNw0OHhEwXZvSqeb4zP7nwcU5NHRkfk1BO0RJbE
 nN/eSH2Ueyi+0gVxd3QBR3BDQkKEuv2WaLQWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Md81JeCJhqd+EeMrbGWNw/nR06kVqy2oVh9RDHN4nQM=;
 b=mNcktjIeYZHrFWUtZK5pkzQ0n58z7OIESp3p9x0Q+RIFzgie3Zgt6rI3T9wleO9Ulr
 AmE+EaaDI6zWWy/v3QJtVWbkuqb8axv2Unz0T/bgcKBBmW8Nk8+faknuGnKzwn0Al9oW
 GKshI5ItvPofpTxJ0OKsmutMcqsNPp3cUMxWH0YTJ+pN3E92AMc/EReE8YwxzTU9GBEY
 MrBZ7Steglgfy2cUebEa5FzNxVxnPbIPcke4ig3yTTa55GdsqSqAr3nf4wJfTu0Pcr0Q
 Jqs4AzAOgm2bX1XaE475p3z0ZSPT5kC5o1PXWwmqY44NoW7c0nbH4CqBfAmk4EZkSyYl
 MMUQ==
X-Gm-Message-State: AOAM533M7Hjgq5hGzpX05e3fnymrmjPTQfTp5kekhw8qpfj7yp8bv0Xp
 9aUaRDZy8x7FUHBeVl7Rx2q2JA==
X-Google-Smtp-Source: ABdhPJyHPV41Ma7zAHE1WQCOSbAjo55KroDD0E3pnFUn2+ytJhzurpLQbWSkYvK4ves8YgCktJAAtw==
X-Received: by 2002:ac8:7245:: with SMTP id l5mr32609143qtp.206.1632317971296; 
 Wed, 22 Sep 2021 06:39:31 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-01ae-c37f-f577-ef41.res6.spectrum.com.
 [2603:6081:7b01:cbda:1ae:c37f:f577:ef41])
 by smtp.gmail.com with ESMTPSA id d9sm1716320qko.111.2021.09.22.06.39.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Sep 2021 06:39:30 -0700 (PDT)
Date: Wed, 22 Sep 2021 09:39:28 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20210922133928.GK8579@bill-the-cat>
References: <8a963f05-04d3-c9cc-ccc2-e58b0e83b6f9@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <8a963f05-04d3-c9cc-ccc2-e58b0e83b6f9@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.10
 = u-boot-stm32-20210921
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
Content-Type: multipart/mixed; boundary="===============8184291981034375255=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8184291981034375255==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="15rqq6UvmZq3FwB1"
Content-Disposition: inline


--15rqq6UvmZq3FwB1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 09:48:57AM +0200, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related fixes for u-boot/master, v2021.10:
> u-boot-stm32-20210921
>=20
> - stm32mp15: fix the used partition name for U-Boot environement with SPL
>=20
> CI status:
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/9197
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master
> https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> u-boot-stm32-20210921
>=20
>=20
>=20
> The following changes since commit e3f5edf65916a881b71eea54f475c7a4bae856=
5c:
>=20
> =A0 Merge https://source.denx.de/u-boot/custodians/u-boot-marvell (2021-0=
9-20
> 08:45:26 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> tags/u-boot-stm32-20210921
>=20
> for you to fetch changes up to cf39d0c29dcf332d7055d0545fc95e3379d91a62:
>=20
> =A0 arm: dts: stm32mp1: use ssbl partition name for U-Boot (2021-09-21
> 09:22:01 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--15rqq6UvmZq3FwB1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFLMhAACgkQFHw5/5Y0
tyyFFQwAs4WhCn1Z7USVvm6MdWX9lXxWDXB4xOPnqaHsldjJ4b2gfPiT73ySevb0
aLTH2iv+n+Q3hTLwjvUmb36ltnHV3DzX5evLg//vVLah5gjk1xcTXZ1FFk1Waj7X
kQWXz7P2pOssmZHqYI+ZU6PagiYhjKwq2a/+NvhTP4rW62zfSUd1ZmuksdCLUDe7
JSRiEdqUeLR0M4NyPXUNI7MWu5N5ueHblhQOR0/HyIwXx+Eax79pq0+pjTUun6KD
ES71wwwE7g/MnJP5BSGJXhA0Z8dhebhvlVtxmUfY9YdjF2X32Bd7oOYIQ2wA258Z
p++oX/pJnEZJFepX/174rHMSV0NNZhOnVaKPMZ9qmQMGfO2dd2DLxNYNxAsMYA2f
UtqJKMxQtDZL1ivw8BMyfBJF0fVa6q3Cv8/uZ+sM+hsevEQ8neQ2oX/z1ckK0qX/
iprgZEc1A9tKsIq33tu4dn/A9DHILdjaG2aEWekFhEG61OBArDwXw9e9EIJdeevc
P+kexIEP
=nr8U
-----END PGP SIGNATURE-----

--15rqq6UvmZq3FwB1--

--===============8184291981034375255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8184291981034375255==--
