Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 866CA3D3A4D
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Jul 2021 14:33:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 350C9C5718F;
	Fri, 23 Jul 2021 12:33:58 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3FD0C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 12:33:55 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id a12so1525107qtb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 05:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=21sUQf/4BAZ8txNhesUuEzrljSt8qWEFGgfflVDbcy8=;
 b=CQlyzM6wv8/TbQS3yYIW0VjP+7DFnNo2M8PMRr6nn1zW+J5OptYXLPwltSIUWo9PEJ
 ckeHeghg8EpR17RylkKjUYHv7Z9UpExwpyBhB0E5qqOB2zNvb5SbbkNkJLmrtM5eWTK7
 7gweJGeOrjU9FJonffZhp3fMegGfqPoyW/6Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=21sUQf/4BAZ8txNhesUuEzrljSt8qWEFGgfflVDbcy8=;
 b=d5yoAg6TugYx503H5Hhznd+rUf7AYygiV9sihALkvqPPEs5lHNe3Uv+QDSHHCu4M73
 51zwl/A71c6+MKzJ5GXoGnSSmKHIt3cM6AHJyLEMHmHv2tyS1tTmS9rK2H9e1P/XCmjj
 1NI74t7hGjWpXxAPO/2xI3QU0h9nMsPEY1OtZ+uYViVdhfqbcrmAjg9peRtRP3ajlpai
 4lxlH+x59Dr2FX4dbShgqbT3CMRrqMQiauQnOLZeCkOyGaf+PlCM+90LhCsRx0LIQD6X
 OawaGFbtsPrNVx8/ps2HIdcMLXWjIBud8BdV1c8q0VnoRRqGkqxeaK7D6GQzHrR7ZR68
 X2FQ==
X-Gm-Message-State: AOAM533UvJw3A0UvBwvLyzx3yP80mWHjQGbmAzZB/NguJ+lumhJUi3q7
 VGeNlZicMonnfKSC/BYOSFT+fQ==
X-Google-Smtp-Source: ABdhPJwG1LZQu55DsocW0N1tFLo8dd25iKeDQwn6QRZHyMnDIiPpZfFaXMY9ETSOtiOpg3xnE/d18w==
X-Received: by 2002:ac8:5502:: with SMTP id j2mr3804502qtq.116.1627043634404; 
 Fri, 23 Jul 2021 05:33:54 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-5560-078f-fb66-41c1.res6.spectrum.com.
 [2603:6081:7b01:cbda:5560:78f:fb66:41c1])
 by smtp.gmail.com with ESMTPSA id w14sm5020739qkm.81.2021.07.23.05.33.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Jul 2021 05:33:53 -0700 (PDT)
Date: Fri, 23 Jul 2021 08:33:51 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210723123351.GN9379@bill-the-cat>
References: <20210521094728.v3.1.I6851dcbaea90c8b6ddcca5310e3c4ee58c824706@changeid>
MIME-Version: 1.0
In-Reply-To: <20210521094728.v3.1.I6851dcbaea90c8b6ddcca5310e3c4ee58c824706@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/2] cmd: pinmux: update result of
	do_status
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
Content-Type: multipart/mixed; boundary="===============2793322957880810598=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2793322957880810598==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="buIjhH4yeEd3S+4P"
Content-Disposition: inline


--buIjhH4yeEd3S+4P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 09:47:31AM +0200, Patrick Delaunay wrote:

> Update the result of do_status and always returns a CMD_RET_ value
> (-ENOSYS was a possible result of show_pinmux).
>=20
> This patch also adds pincontrol name in error messages (dev->name)
> and treats correctly the status sub command when pin-controller device is
> not selected.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--buIjhH4yeEd3S+4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmD6ty8ACgkQFHw5/5Y0
tyzReQwAo4i9436n1o7ADJgFAoroLu2bcz7BgCgtvkTpSwZ72HCJSxfYYyMJgoDT
f8YPLthe6/Eks7HgDvKBKuKuD1GrXXVp0Eu3GBmOh+aMZHg2Iy5urz79A9NiBHJG
BXezKCiGVKZC3P2vCFM9ndLK407oy3EhOpMwF9TDHZ3zGZ61UICFi5Q8RDSOt3Sp
5eByKwj+o2kFQyo6n69Ob1+IpmCiYIOiQdZFCsn7z0owcczlKCNEWH3Z7ZicKMFW
SgOOkHpuYSRDX5gLqtGT57AiAetfGp3EfI+ZUfKG6o8JhwVSWuUUxFXvaPUjgJrl
mEQPGmoczRYUe5x3+cODtkrQkuy8rVYQELrtkDI7YjXByhlYLKfB1rF/N0y58EAv
24/vFlxBRQIxIkCB9jdYRNUn1pbfnTqA5iQQeDQEtAvzkPg+BVuzggyOUyLhgD9q
WObGynXlnm1gPCj+i0z2apTtAHP1q7aH2mf+dnDg/tSr7rJnGSN5D2oSprWP/xaQ
9k86VFSS
=hxIQ
-----END PGP SIGNATURE-----

--buIjhH4yeEd3S+4P--

--===============2793322957880810598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2793322957880810598==--
