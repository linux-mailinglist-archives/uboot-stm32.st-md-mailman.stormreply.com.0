Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B4417EA6
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Sep 2021 02:37:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3B0FC5A4F4;
	Sat, 25 Sep 2021 00:37:06 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C693C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Sep 2021 00:37:05 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id cv2so1347521qvb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 17:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fBw+iW5HyXj8M9Ip5J4aH/oS5Zs1PwEksa5muyy0XKM=;
 b=JIqxUjKyHa2dhzlZfCAl4Z1wIz7mwYEOmqo7gVQaEU83MZKigtiUrfjH+YwmelwkLv
 kfzk4MDOYL6L9lz4hhkKNgiFW9p+/A42uSvN/NFecp6Q0j79KD7qE9nyDTcht5KEDwyE
 /QiqDc2nOb3hkdTEgS8OaSj/khwfDu3XPfIG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fBw+iW5HyXj8M9Ip5J4aH/oS5Zs1PwEksa5muyy0XKM=;
 b=sKY72y1t/TemCAToIgyo47GzsQv4iRj2sqAJgWNHsTo/GwFV+DUxMgUTAM2mdAvoJ1
 iTwr2rgMJIBIGvK8Kdm3oC9XMy+hdCtDIIt3SY3rCIdl0b6+SYCuSH5MyD9GXvOn753j
 3bc9ncb3PEqEerQZCu4ZI3hpeUyCDWRm2S+k0M7x+PBGRNL2KkTOyaFI+PE2EbvFkyZu
 T5ydzvIcdPVBqZl3fe04t21J9yjuZBQxQY5onyXvp5fOZmR5rbpoEnWoEa4r4F8yD7Ze
 bxIqUrdGMn1swtxlMd4jp5FA+K/dJvrVgs2h8Lv2d7VzuaMIHmrH+VGWgGhlWMgJGEoS
 TQVg==
X-Gm-Message-State: AOAM530FyW5nXzlYfodmJZD/NXjjft0RmOGdfmRYDu+d7FBLjiRP65mj
 +0zO5U+XCJ8ndWi8UEXa40N52Q==
X-Google-Smtp-Source: ABdhPJzWrur497akCDU42I5Ly07nBr8QECj6RY1RaV+GLTXSVwMUps0mH+UcZdKtK4x0mgN34utrzA==
X-Received: by 2002:a05:6214:44a:: with SMTP id
 cc10mr13362222qvb.58.1632530224354; 
 Fri, 24 Sep 2021 17:37:04 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-9907-3395-6a0a-dd86.res6.spectrum.com.
 [2603:6081:7b01:cbda:9907:3395:6a0a:dd86])
 by smtp.gmail.com with ESMTPSA id a16sm6501158qkn.16.2021.09.24.17.37.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Sep 2021 17:37:03 -0700 (PDT)
Date: Fri, 24 Sep 2021 20:37:01 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210925003701.GR31748@bill-the-cat>
References: <20210903102331.1.If60c46be1f9a6ba3b7ad548fda51ef631f3a33b2@changeid>
MIME-Version: 1.0
In-Reply-To: <20210903102331.1.If60c46be1f9a6ba3b7ad548fda51ef631f3a33b2@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: use CONFIG_SUPPORT_PASSING_ATAGS
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
Content-Type: multipart/mixed; boundary="===============7881724050040816559=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7881724050040816559==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fL5uibfitsvsbG47"
Content-Disposition: inline


--fL5uibfitsvsbG47
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 10:24:39AM +0200, Patrick Delaunay wrote:

> Simplify the bootm and the spl code by using the new config
> CONFIG_SUPPORT_PASSING_ATAGS.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Tom Rini <trini@konsulko.com>

Applied to u-boot/next, thanks!

--=20
Tom

--fL5uibfitsvsbG47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFOby0ACgkQFHw5/5Y0
tyxKXAv/e8KmOOGhi3uHEplfdJaLyda9NrTMaJ7Kt+jJNbt6uUObrWBOMY21bVzs
2gnLv39IRDtCHUcXEBp+DN3RAwX2CFGHlmi2yJE3H6cgEHvNpdSrxjR7ExsvR9rY
fODBkFrIkcLyzP2cgr1AiM1pubHYrfrTTwSMvaAmCy6azxEZwCSSGdUXnvR3xWas
i/gJc8zFUbXe2G3Ew307EkR+UoBtPa3M4MsLSfxe4cJE6JrwNaNyLeuqhEFXsjuv
i5Gr3gJKsth7UuDSR/6gP/okhLbY7WAeEQU2aNEUbt3fD86Jxr+m2qQaXi48dWKT
baf+2ic7NkSDPjR1KMc97/aVnaqe7K+pO/Jl9UEM8xgu1TyoyjhgIVOXEIrFEOmc
eJEbUkuRUVFJTRJvfeJj30093CbQTQJuu7MOsSEpMgz5YzbuhWJ3oxPL811ZI00L
skBcmKsEiKCYhTsARKs3Qevx1O0hPaMvTke/pg6GyBX3RhgbZZU/5ILAQSYLr+ua
tcDqukzF
=lA4+
-----END PGP SIGNATURE-----

--fL5uibfitsvsbG47--

--===============7881724050040816559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7881724050040816559==--
