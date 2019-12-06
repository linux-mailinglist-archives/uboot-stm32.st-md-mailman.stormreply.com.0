Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7BD1158C6
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 22:48:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8897BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 21:48:40 +0000 (UTC)
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D89BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 21:48:39 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id w11so3295657ywj.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2019 13:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LmgZ5n+wfSMl/1PZlNNSKKsJivaEa3pUGtAVqoA0dGM=;
 b=iC5DcSHNw4Z0U+ymLp9Ev8uVWKw3wdWZAWbtxMuHN0N15h1N/Ck/5qYmKeJzRF8kHI
 AKP5lNuoQvBRjZEdEVIrrA5BWoU/jChyG5RjAC4oZECtEOpkHGhGa8Q/gIxvcFqbjJTI
 L/llzdzXk8GCyyC+v2Fz+hwXEwlo1UvMwG818=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LmgZ5n+wfSMl/1PZlNNSKKsJivaEa3pUGtAVqoA0dGM=;
 b=bRP2SS31vh/SeA5fbDjWLDv8i/urPFll5PvgTAkjdok9HZxoqTP/in/WTJQAx4xok4
 mr7frryllwL6qL7fmF5FFd/uFxZuO+DnpY7VWcEYw7pqRkdQVgEsWkSMXhsKXnAHSV/O
 LovtUvhoYn2BbgCbeylHzSgwx5OGKr5Xa1LP9D6WDudFZnLoZL12C7ZKsRwxc2lprGQJ
 MvLzrUGYH7eNBskdxykxPPk78egnPXQupO2YVQBGfoj6drZGks5KklLY4v2SGekbjbjL
 mFy+jMEhSGifqHGCyl+r0SvqMs+psOCGoEYXGIYxoTsuzXGDCeNi9dir4PAxmGIASFit
 oTzA==
X-Gm-Message-State: APjAAAXuGJjEGjOTrTCqzYN+W01RUgFK+oZokzX1tNRGnV23uu03tyiB
 4l0PM+NNmoTJ80j+l/gnDHQ45Q==
X-Google-Smtp-Source: APXvYqy/+Vsya5jX+DGSFG/b5mvbs9S0h5xpHSVofDR2PqqEM6Uol+jNC6NHiWd/aYoX4fROxdRvBA==
X-Received: by 2002:a81:5d5:: with SMTP id 204mr10650305ywf.46.1575668917909; 
 Fri, 06 Dec 2019 13:48:37 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-d558-5e40-3af2-2592.inf6.spectrum.com.
 [2606:a000:1401:86dd:d558:5e40:3af2:2592])
 by smtp.gmail.com with ESMTPSA id e63sm6602893ywd.64.2019.12.06.13.48.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Dec 2019 13:48:37 -0800 (PST)
Date: Fri, 6 Dec 2019 16:48:35 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191206214835.GA9549@bill-the-cat>
References: <20191125080741.2215-1-patrice.chotard@st.com>
 <20191125080741.2215-6-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20191125080741.2215-6-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 5/6] cmd: sysboot: Fix
 checkpatch WARNING/CHECK
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
Content-Type: multipart/mixed; boundary="===============1660954976809777878=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1660954976809777878==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EzkxZBgZHYT9HRVh"
Content-Disposition: inline


--EzkxZBgZHYT9HRVh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 09:07:40AM +0100, Patrice Chotard wrote:

> Fix checkpatch WARNING and CHECK issues
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--EzkxZBgZHYT9HRVh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3qzLIACgkQh/n2NdMd
dlKb9hAAxFaBq60CPPYJhrx5ixQTAIG1r7J0JU9fzON7BreY15NdCixMuzLCdeVK
mFkxrw/D02b87kunh0mg1XviY/i/rkk9Qqf7qI6SGpb95SML+rQHKlvhgNzE1+Pu
IeT2jsoZZX5QXcoI3+zLIgKtMYc/FZ4zSx7G806ZEKezIuv03dF9w7MeZqhmVlaL
RoPEPu36Z5QnB7jxAKXM3cyTZQdjDrKuvhIGUv57aLMgMhzi3FkGjxr/tVdr7IlZ
umzyZOyrn892gJitGatyfsC55wwQ8K8WMXexeHVFh9C/5FXioUpg/MfuhT6a3BuC
PcymXZqLlq4qy+RYGD4TSPTcO+eXAIG8/GgEHaI3jb14WRyd5glHOUdUHzGx+iq6
WGdmnfAKVBDBMp2qvXu5WYeb4hd4xYLBaJbDdsB2G/qFp1BkkR1e6kr9Dk51Zxxr
QC4GXr2nwIHZKMsC4ZFLqJyNKSHWrdhNt/FG4wIoblO5Me50EhS5M41k8v0Gy4cC
GwSP0iCGaso20crROIy0TLK0TLmndZZqt7d/ZC8NS5pp+Atwc17JdTBTFT49Ffep
qs68AMpohGewxdzDYre2ODmM20PO3mPfqsRDbKoSlKT8Pd38QpGVczLug6gzT6RH
40S3GtEwdmC5WsQFDKSOF5J2b3YAGbG65bLZQq7xxEyu8EujLnc=
=NUhK
-----END PGP SIGNATURE-----

--EzkxZBgZHYT9HRVh--

--===============1660954976809777878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1660954976809777878==--
