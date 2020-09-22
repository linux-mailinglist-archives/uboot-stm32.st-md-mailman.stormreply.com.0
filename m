Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D21772744FE
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Sep 2020 17:08:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DEDAC32EB3;
	Tue, 22 Sep 2020 15:08:10 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CA0EC32EB1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 15:08:09 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id cv8so9668511qvb.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 08:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WoEmKZIMOFtH3JLHCfwcKFHcbZkYmXfmcBA9H6NF1U4=;
 b=ZyIQH4vmR4tn8pbku0w6cK+NRFWGdURQWvvhDC+CgsdOZ5Gu44Z3PahMtHx2Gg5duA
 TfueTEPmDn5P9ayp6LP7Qs6ZQum8vY+D/GDXgzy1rqgsg5UT+82cA74Jjq3icjiRBOYp
 1kgHClCtqo2cdCoxdl4bvbVaq25uX3YU5Qfdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WoEmKZIMOFtH3JLHCfwcKFHcbZkYmXfmcBA9H6NF1U4=;
 b=gZh/fdVDjox39iUmNHxBbWNnb4DHzt8U4QYto0QHIydZXU1aEWjvgFSwyP9bk9Y6Lo
 el5+EEAE69tK8CGsNIONgtH0maZqOWrn3LVI1Zhh5gFOJYe6hY/hYsA/e4biWpmbLmmp
 F+24UwKVblX4q/lo5qj4yTTgIBY976uMl+DiaXKVuM3PT+eT923GAq7aR12Ja+0jMsFH
 gCxBwSmY9UlRYqQqGwNb0yqEY6k/7EH6gmVgjTU7mvJXc8vMYRUspy8vrEURx7v+BtsS
 O69UhjoajyOvRfyvkcz93I+raAlmhFo8JLdlFyJTyE7qH/0H03Va2SqIIJ6GoUEZWuVd
 oaSw==
X-Gm-Message-State: AOAM531iC4gBCg2gNo8EOkdnXfCLermbpdDJVbIa+6YOHza51cy/wXnT
 4QSlBrbI3d2kza/ln1/EuVpwU3ouQKE3/3VA
X-Google-Smtp-Source: ABdhPJxzEzAkxwmDlPjb76hAAjS4zWVTTRmhsVz1Mj7F2kCGlKodgno6a2+oPGWS8np4Sxam5y1cAg==
X-Received: by 2002:a0c:ca08:: with SMTP id c8mr6331435qvk.42.1600787288297;
 Tue, 22 Sep 2020 08:08:08 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-a44d-5ac0-e6e7-4c04.inf6.spectrum.com.
 [2606:a000:1401:8ebe:a44d:5ac0:e6e7:4c04])
 by smtp.gmail.com with ESMTPSA id e26sm11486952qka.24.2020.09.22.08.08.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 22 Sep 2020 08:08:06 -0700 (PDT)
Date: Tue, 22 Sep 2020 11:08:04 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200922150804.GG14816@bill-the-cat>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
 <20200703153646.28533-6-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200703153646.28533-6-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 5/7] ata: dwc-ahci: change trace level
 for phy errors managed by uclass
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
Content-Type: multipart/mixed; boundary="===============7298520877965903659=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7298520877965903659==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="71vIRUdx5Wzj+PCo"
Content-Disposition: inline


--71vIRUdx5Wzj+PCo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 05:36:44PM +0200, Patrick Delaunay wrote:

> As the error message is now displayed by generic phy functions,
> the pr_err can be change to pr_debug.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--71vIRUdx5Wzj+PCo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9qE1QACgkQFHw5/5Y0
tyyW4AwAid0BtOU3MrHru0CHTR34LHM7XsCdzT2BnCOEjHf5VYK5IM88FOWisEal
myb8FaJLmQextC8/Nmo8Xuqq2FlLRig/J7mde9hCSQRqN96i4J3Ow0qTxrEDghk/
bV9yHWk7Xb8o1UC6se57RwZfCdnZ57tC6+bJz/9hNf9gR04vSifuu50JDHQ4FFl5
JjPiL12j+M9QwxYURGH480P8hVNP8Z4aT3T4QqJhe6q3DSv2LZYFIRa04cywi1NZ
eEwOd3iRUVAY/xvSps0TUAEZXtTC3Kh4dm9/UF8mdiAportLsQX2wPWw8NQxk/Mx
DGzu9q16yH2YdZoW6rTEJSPGYWMTpf7JeLcVmbwbCqqcaVhXyHd+bcecToJIRlxU
nQAIWRnOAUqN58YB/yh0ogOfcMqwRHtXhMG0+0e0Ou9OhCkO1TOE9bAl4LpVSRRq
aTOoYnuEfYxFsZ9eOr39NqsIEbqZjz+cEkElHw8eZMrSCZOHMZ9pK+Td3GYd4KIq
OJbQlVC+
=/oJU
-----END PGP SIGNATURE-----

--71vIRUdx5Wzj+PCo--

--===============7298520877965903659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7298520877965903659==--
