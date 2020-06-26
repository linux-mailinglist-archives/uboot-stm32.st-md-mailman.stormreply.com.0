Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C91C20BAB3
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 22:55:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67B5CC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 20:55:04 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCA6CC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 20:55:01 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id i3so8475617qtq.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 13:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rqBiwMlq+B08BHJa8ZEAsCzPH/YsULC63deQH5Ya7+w=;
 b=EEm7zcnVjcZnm5oVj3dKZr2o3c6ln7zarp2+CydtDFoJaabmg8+qvF9Z8q5dh3QRtA
 ruC5F1qfIWX2O8L3YGBy5ZABQNTt71HLTSSg8HwQTdaAONSw9uysG28kiIc+IcuuqcBZ
 vBGAeyIq94ZakR5ERX/vQ1fa+IAWIre8IAYGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rqBiwMlq+B08BHJa8ZEAsCzPH/YsULC63deQH5Ya7+w=;
 b=Stt1evdEnBCl2GkNI12Yk0SYMM3si/avWfeC/1/3FpJSXOXQ0aLYppalcAVABVOZaq
 dvfknh7bbc4syg17pTDu8ZqMqtwXfagH2b2IJqb2TeNuAE0I3djvvJ9qGaogL2WeKY8T
 qznZhW6H6tXJazq/DNd0zPQuclCTcKyzUJ7djHkoPNJDAV4v7u9SPn3mm/cS0ksjedKX
 na56Xe4bFeSRZcBYVsyNaof15NjnxY84qE4+q2x1c4a3L5jys9RweHV/nnQ0kCN6plcM
 Ve7A5SkEodwHfKYWpKbhEELuDHp/YKgcFa9Pd4hUt29rObZ6CGZxkGLeaRrnrI7lhI1K
 AHwQ==
X-Gm-Message-State: AOAM533mp6+gJLgJrOMSEcuxw2zw35AuK3nOdmBRDA8VPx6BZ6XmSjLw
 /xnsg+CYppJpJm4DroEEB4aJbA==
X-Google-Smtp-Source: ABdhPJyJIZ+liDJhZ3U8J9PPFE/vcxehgusLXdmHywas5b5iACtHsCYStE346jFXKQ1t0M2gGeYJ2A==
X-Received: by 2002:ac8:19c4:: with SMTP id s4mr490289qtk.117.1593204900723;
 Fri, 26 Jun 2020 13:55:00 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-bd3e-bf60-4b70-2dd4.inf6.spectrum.com.
 [2606:a000:1401:8080:bd3e:bf60:4b70:2dd4])
 by smtp.gmail.com with ESMTPSA id 18sm9181242qkh.40.2020.06.26.13.54.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Jun 2020 13:54:59 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:54:58 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200626205458.GF8432@bill-the-cat>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
 <20200625075958.9868-4-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200625075958.9868-4-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 03/14] env: sf: avoid space in backend
	name
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
Content-Type: multipart/mixed; boundary="===============5663670592003654717=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5663670592003654717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="52aklQ8BZHJhx2Z3"
Content-Disposition: inline


--52aklQ8BZHJhx2Z3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 09:59:47AM +0200, Patrick Delaunay wrote:

> Remove space in ENV backend name for SPI Flash (SF)
> to avoid issue with env select command.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--52aklQ8BZHJhx2Z3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl72YKEACgkQFHw5/5Y0
tywc/Qv/RTFRfws9+H/jDl1dsl7yGvHtrt2XIECOcGxfJ4rsh5cuk0RxjF8P+f57
a+006eQnaLI2xXvlJZ+Siu3ZfXH2RoW3ygXD8gjBfE+9KG+0g1/hfEJN2vbLIt6t
DSNIgeZIOLTARuqbcAXRkIEK6p7uzFNDsi6yBWDcZwXwSfBOl2f089y5XYKz9pr2
OFL1ASwNdwq4Cbr/1tPkxxPsuZS0TAP5QE9vl/LlRDYVWx9sIi5nLx6GoEoMkJ2x
KcjT47OzTboRSPl2ugJIPhkYn57QjEOvytJtyynnH/Nz//FbR2AF1FS0a6y2LVHj
QWqEJvb1o2klC5b8CNppW2HEk38GMvPjsZoa8ZTVcQxjT6I3UC1GZ8UuJ1gyEt4t
mxETlHwH/JYHInCQLgRtmg4fEFYxOKTVujbGwMyGKXGCNBiT56NEKmCX5GCqwnXs
k/yKErRiUXfRBOTEr7vnZIdc7q4/Al6J2S3PGo5svaU82R/L77xjYiTnUAHMAZTO
JlCWJHHS
=34qi
-----END PGP SIGNATURE-----

--52aklQ8BZHJhx2Z3--

--===============5663670592003654717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5663670592003654717==--
