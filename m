Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C02F8DA2
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:21:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE552C5717E;
	Sat, 16 Jan 2021 16:21:30 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56C80C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:21:28 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id d11so5519320qvo.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7bYmhTfXnI2sMRupGjV76rqUhd2zSpfdh3gJR7HPdlI=;
 b=gY82NhVbXCo0TgPHNf6q2HFi5Z0O/a4iUkzknOjzvEByC0oPph4YiTAz2hUp0xhZeo
 plFgdgbrsrTXtROybNHUGOMuHUEiYS1eOwvus3wJ+HC+AU0+xXapJ3JfK3JvKdPwlKZZ
 hgMLyyKEveTftjMX0p2loZEeOh51TAqsEChk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7bYmhTfXnI2sMRupGjV76rqUhd2zSpfdh3gJR7HPdlI=;
 b=hdDjkfkrpvI0GmCk5YKrg+pScbyuYr8ypLQoALqXFbiJfq4B3GvZ1BwmAhTPZH2pXx
 papsqg7vHBbIwjc8I2Z+OquMR6l82lpFcU83tZ5JqPARjKWaYIyQHrRcluQOE/SSzYex
 BVMWZV9DzdXIxj7pQkZSEEkbazfUhMvLqfiKgCksags3hS7g76LT4Sr2k7oJIN/9aHEJ
 z6NAIdQcIRrcWx0EaqTizLIGImBagVt9KrICPLuffOli6HRXf7BxPdu3zsInXRD7y5W0
 cbXr3Oy4dcqyMjmozX5gXukFId6UWPauQW0MtbhIFgR8pYKWNJb1aRaYVBFs1jYYw34t
 b8vw==
X-Gm-Message-State: AOAM531LP/nZw80kgCpkBtpRzND08we61zgKbM+uLFQCcoRNMT8Cufm9
 Z3l2VezHJM9GHIa/ALVGMYfvDg==
X-Google-Smtp-Source: ABdhPJz9T58fpggQwoy6Ire+TZpcJJs7LOY4dBVyJs4DikvOoR0hh1bzrYzPWctAwjAA9UzBjMJTHA==
X-Received: by 2002:a0c:cc12:: with SMTP id r18mr17049166qvk.51.1610814087233; 
 Sat, 16 Jan 2021 08:21:27 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id o64sm7334454qka.43.2021.01.16.08.21.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:21:26 -0800 (PST)
Date: Sat, 16 Jan 2021 11:21:24 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210116162124.GK9782@bill-the-cat>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201127102100.11721-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/9] test: add LOGL_FORCE_DEBUG flags
 support in log tests
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
Content-Type: multipart/mixed; boundary="===============5393076680577579802=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5393076680577579802==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GvuyDaC2GNSBQusT"
Content-Disposition: inline


--GvuyDaC2GNSBQusT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 11:20:51AM +0100, Patrick Delaunay wrote:

> Add a check of the _log function with LOGL_FORCE_DEBUG flags,
> used to force the trace display.
>=20
> The trace should be displayed for all the level when flags
> have LOGL_FORCE_DEBUG bit is set, for any filter.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Sean Anderson <seanga2@gmail.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--GvuyDaC2GNSBQusT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEoQACgkQFHw5/5Y0
tyy8ZwwAsC0bm+NWxylDJ9khULU7A/4tW+uAUNozxKDSr/M7036FhCFzSXkrECwV
wjqMiAmBT+iONshIseIYvV/xyIpPjrwrzvV1iJAErBPrJyOibisQTsLIAvn/dE+i
9g9f3Il4LHTyd5XwJsFVDJyL/rjGHlamqUajFfrXdKUoiwpLtCUKRDsmHbin8Vjs
Lg72fiN9DJ/D3Nk/SZgyI2iH4GkOezjiWgapLKY60R0kxxsTon7SSVjX+4j8sYeX
KJq5+loaniCi5DqAPITZYfjDD0jtRGmWy2Tq3YOJST5SMZ0vwURpcAtLhdjJVCHf
SgNObOJTDbUZd3MQK/PsR6xu382gP0ELsN/zQi8rDOwkSa8zln/QPI9vUlBIKsZj
mWnt41fshmGqYHnu4JbmlZ/WnefnnUSwQmoEJ1sLA36WlUmNEiQubCh8QiAu51cg
Tiop10Yr1ZJntoeRPITFMlIcNnLBLigqA0dort7dHzk/HQKZverMSpOhaGuOKn2l
GqwnIJNe
=2S3A
-----END PGP SIGNATURE-----

--GvuyDaC2GNSBQusT--

--===============5393076680577579802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5393076680577579802==--
