Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F86B234D47
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:42:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64F3EC36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:42:01 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94755C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:41:59 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id b2so4240335qvp.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oz2c+yhrr94UCczE7pO8ZVLR3sYsTP67MH1vt3Tp+H8=;
 b=KPjAqgP0PMXOrdCdjGJ89wJXja8CN4eGgslqgg6+BBf094EaeVqjzThfFGFxSWUKdA
 08SskXPovsqxgP3GLcxMa8fwQkzDXuTvbg8w5k57pIfkVg8sXSsOFJwT6OEYQEkAHz7q
 66E+BcMs1QLOsPUeYOjcGalFnZ2mjT6O4jmQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oz2c+yhrr94UCczE7pO8ZVLR3sYsTP67MH1vt3Tp+H8=;
 b=ORG+qBw8Z2bYmkXgQRmnbQWgbC+Mp+gwG+K4gbQ4ChkJRKw4Vw3Wl7RZro9hFy/ojs
 Qy/wPmDZERD1bWk9hclDS+sAn8Wazt6GUMabH988Wa1LGQGkZ/taTWlCMEUpoALBgIjg
 fQ2cuCaFfuRyJnQ+8oAq/q88W6xNG+kb2zFIRIrmXx2uY/h/AaEYcDZrpEV/SAcsiERr
 hxZPThXm8rm/zKwGpZ6cTajL1Wy475ytOxU8DRxdk3wPzJlcWAKXExm4IDiJjbOKCo6d
 FQKCIcsA/GFnj77Z6wKO9Sf5dbrgb3r0/wh2QVKQcEdi8Tyx0RN0f5oN74X0YebqsopU
 C0MQ==
X-Gm-Message-State: AOAM533TymiQPvMA5nbvSMgSrTc8dxfCFFBstXOD6sN8q7mAc9rskRU6
 3d0bV/FL3mNXa6rQavtatZXsNg==
X-Google-Smtp-Source: ABdhPJylfe/ckOsvYEe9vnNDIfIVB8id3LUf/jEQO15jvZpTY/AphDyqKdq6TgjEpYEgmpAdcmYe9w==
X-Received: by 2002:a05:6214:11f3:: with SMTP id
 e19mr6109371qvu.220.1596231718302; 
 Fri, 31 Jul 2020 14:41:58 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id z128sm10038440qke.35.2020.07.31.14.41.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:41:57 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:41:55 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214155.GH6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-14-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-14-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v4 13/14] env: ext4: add support of
	command env erase
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
Content-Type: multipart/mixed; boundary="===============5085514447562631679=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5085514447562631679==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qkiScBn3SbsSxGVD"
Content-Disposition: inline


--qkiScBn3SbsSxGVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:26AM +0200, Patrick Delaunay wrote:

> Add support of opts erase for env in ext4,
> this opts is used by command 'env erase'.
>=20
> This command only fill the env file (CONFIG_ENV_EXT4_FILE)
> with 0, the CRC and the saved environment becomes invalid.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--qkiScBn3SbsSxGVD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kkCMACgkQFHw5/5Y0
tyz8/Qv/X8PydahTebXmfT/e6BGJOpfgt1D6rHTvmQCh3/0a6zqSsUV74epxtbyW
1358OGT1f5nk8hkfuShmiHDEuLiUJSYJoiAUtpHs14g6czsLJ0teVxKZFKi9dGJX
euVnZcKvkVJWPrTFllSyA9N34I4R1vd4AGHVR1M9WH5hl0F8qYeNAcLeyJkVbIVV
H8zMucbDHPp8GEeRaf1r/kTOi6A9Ywrvgo93/wys9a+LyKFhVlTnpZyEF04alWcf
nu/0D12wpKATdzKFP7zMQSIon3f7sm8Ou+sWiVSp6dTBytJ5E7HY4+3Eo3Omvk1I
J4Gdbc+7eaY+Wr3//nYiWcmo7qEalP1Ecjtq7NlDQRuw7wlUr8XXLIiAQXky1PQQ
YoCiebaGNMFIJjlljrMoV3fJ3kC9UqCmbykSO5Y9NH93dWCg3MtjZaAZpUW0IlT5
EJSewbS9dzsVZ77RCYYzEnl4/MFBJ3ev7TADf8Qfz2y1owbruXTqeezDD0gcxUrM
mUFiPVgs
=K9zj
-----END PGP SIGNATURE-----

--qkiScBn3SbsSxGVD--

--===============5085514447562631679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5085514447562631679==--
