Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F44234D45
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:41:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D57DC36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:41:54 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4DBFC36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:41:52 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x69so30230692qkb.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZJyG41PKjzVniQ9al/WlLaTfAysfAQtD20Fflar7J2M=;
 b=ehVXsO8qkbtdLGpKshDYg8oKHxawFq0lFr8SPNpe6F4yrbwwA8pU6uZK3pGItLLjh7
 ZKv+vC59Dv6QNXUMBeWO1OqLXx24L8WR9fvo/CubtP9olmMw1z6FxNsHc6imOtdAHyvf
 /ri9Fg24+OOqA/mDWbXcesrrN/TsMFGMry+Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZJyG41PKjzVniQ9al/WlLaTfAysfAQtD20Fflar7J2M=;
 b=j6enNrmaEbSXhSzClxMhVva4/eOHSL+7HdO5Zgi0GUlOTjtbjqX95r9ytWKvMjUxH/
 zrckPE9ZVGIixDoxXSedhIdBWNjo6iqBgKJNugPZjy3gXH98DgpYmuwbAx4mDhyRPw6H
 hwNpanV43yuu8PWwulo7cw3+hophQKvrJRadp+PJUT3EqEpUDd0LqKW9fnqxs2b1jmdj
 +B56tkp8r8cLLjlxb7T+a9LTc8kRkaRdw7QZGQsDic7LKn0gofUcr4eUAsJws1G+iU9v
 +pZQLIPYOXTZORBMkbjxDDoj0JNTWFhYdkGV4D54Yoozi3XlNOCnKgWWuQ1CL/ldyV7M
 1T/g==
X-Gm-Message-State: AOAM531k6qwZhLurD7ycb337sjuh3ULlTn1KKIQTlniJhzge8ClU4T6V
 hkcUGmNSlIUH1NfnYFRBJJFCAA==
X-Google-Smtp-Source: ABdhPJw05a9ksIcwjsrP0+5VS02Ng4HOEv42soiGL2gFpWPY796XsQPfbFPxXNfi6Oyvxc+XXWWAKg==
X-Received: by 2002:a37:a34d:: with SMTP id m74mr6145234qke.358.1596231711684; 
 Fri, 31 Jul 2020 14:41:51 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id c42sm2860185qte.5.2020.07.31.14.41.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:41:50 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:41:49 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214149.GG6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-13-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-13-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v4 12/14] env: ext4: introduce new
 function env_ext4_save_buffer
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
Content-Type: multipart/mixed; boundary="===============3273799681345654108=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3273799681345654108==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l6uVvLg33S+39+i8"
Content-Disposition: inline


--l6uVvLg33S+39+i8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:25AM +0200, Patrick Delaunay wrote:

> Split the function env_ext4_save to prepare the erase support.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--l6uVvLg33S+39+i8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kkBwACgkQFHw5/5Y0
tyx7cgv/QrqFXZTSUUSnsS6gLQKszSFG0uLfS3lMFm0Zit6qtNb2vL7ejpk0fKDd
pADmqfKwaJyUkFSsLtZeZHcKc8sRH/HdCJXuajKWCKIohtQHOKMtu7G/5mITbYZq
6sAc14EcGcdZS55htJs71Om7PMnN2H5aHW1GKtft1qDBzv2j91msCczn484nutp3
X0PJWZvrEveO3IiJgEPO9GtMJQe260I7hgLbMY6BqEvU6B9WK0LD4VT+mJt6Hb1R
xRMPamKJlZnv2sSvRKnDGV0hVu8YJT6nGdFVqDLT1h9cFEvUz0LCSKWnReHZOm1g
SKGW1M73vwZcE/kFtSi9uQjiq1jXL+EJApVuhduY5DvzdToIVaiPQohKI4lIjLak
e7DauYPhA67axpApr2/7ZQHj9JUfTc9hYQ0OhPrhnkFCSmQVI7h8uBWRNbhLv2Uz
Rk4s8GwFBYI3l6gv5Jfo25Nc2Ux7QqhdPOhmiUD0gvS8ZZ3UGsnb6Ln9C0oFoQp7
ZvjJja2y
=olF9
-----END PGP SIGNATURE-----

--l6uVvLg33S+39+i8--

--===============3273799681345654108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3273799681345654108==--
