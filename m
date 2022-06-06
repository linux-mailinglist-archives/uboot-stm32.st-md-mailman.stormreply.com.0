Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D053E50D
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jun 2022 16:26:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B69B8C57183;
	Mon,  6 Jun 2022 14:26:04 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C0DBC5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 14:26:03 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id b17so1816184qvz.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jun 2022 07:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZKfrlGYNkGuhoObcyzL79O2L1p+ylKt6aqYiCQ3KNfw=;
 b=SmmWa2xdyRrdy9h0769Aa4nTo/HT4ElOxs8EuYLhl9Yd1jfhOhALf9fCoH7bi6AbSq
 sIQqzUTQUvPVdsqSZe49Y1XVYxv2H3gA+JHf+9ellbn33n7jZFiPvfvcu0CU3sWIhjLf
 6FkbsMBz58GzwIu6SIO3jnd1Ye60QKXs8J9Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZKfrlGYNkGuhoObcyzL79O2L1p+ylKt6aqYiCQ3KNfw=;
 b=X1cW1uMAL7q/MIRC8YtKY42zj/IxKMZ4idrcbXyUWJc+JjwMuEcx97zfdwpsw8Acfr
 paUP13EG3PVIvYs4tjxQ9QRthwDCxdeLJ8VRSJoKnBYKYDx3YqITh/GQ4lm/FO8eY8F0
 4hXyCUBrzmZa+fIuPdA1QsZPCX63RS7H5npaYjHi0QHa0suZg6SNeR1qS2P5IaDbnPVy
 39HfDCrU0vfZ33ZaqhM3nYMglX7NoFRXnOolYCfjb4JNvBmK0Z03z2KABP1R2pm5SlNJ
 VRDED9QmshFhqufDnP9tcAZ4OONsv1gusqmgi+EthnKKQuzzNDzNYc0qL7pXfaHR0Nci
 loDQ==
X-Gm-Message-State: AOAM53098cGAHknQJK+uobaKNIPmkuml1MUKqT7gEZvpoCairk1cuW8y
 OM3jQIlkTtYkvplHQ8yucFisgw==
X-Google-Smtp-Source: ABdhPJymbjkQSt5ht53S4epqA4yegu4wkmLT+eSPh5imMSWjkW6NqcKMJWV+NbfgjHEM0ElqIl+wlg==
X-Received: by 2002:ad4:5be6:0:b0:464:4f31:870 with SMTP id
 k6-20020ad45be6000000b004644f310870mr31206371qvc.109.1654525562123; 
 Mon, 06 Jun 2022 07:26:02 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 e2-20020ac80642000000b002f905347586sm9711716qth.14.2022.06.06.07.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:26:01 -0700 (PDT)
Date: Mon, 6 Jun 2022 10:25:59 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220606142559.GR1958597@bill-the-cat>
References: <20220602183406.1.Ie33bfca463591ba2decd642aa4a57220a3b2bffa@changeid>
MIME-Version: 1.0
In-Reply-To: <20220602183406.1.Ie33bfca463591ba2decd642aa4a57220a3b2bffa@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min <dillon.minfei@gmail.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] doc: update mail author for st-dt.rst
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
Content-Type: multipart/mixed; boundary="===============6209820206786444525=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6209820206786444525==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CKf/2jVYos1l2hij"
Content-Disposition: inline


--CKf/2jVYos1l2hij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 06:34:49PM +0200, Patrick Delaunay wrote:

> Update author email address with the one dedicated to
> upstream activities.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--CKf/2jVYos1l2hij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmKeDncACgkQFHw5/5Y0
tyzBJAv/ZJ4KzCE7bX9oJflKQEaO47I1ghAsHjky+drjpjF6foYEOueXm1wcxXbw
bvGunsW9KnXxpF6BIdt9EA363Id+9R+uUME9NqBaFJ60x755xQkJrm2uKTUuOOoX
f0Je1taldb/CtOWHrPr8TPOHx77aFAx3eY6N4yircD2A1waC55zF9Pk+lLgdRMpW
rPRci/zlACo5VaONM3+n5GALAsvkU9rTasQa54Ck5AapZdCoTxFF6j4bFtujRh92
0ol23Vmlnjy9XfPltAbCqu86uldmDcdEywGenL49dU5yKTfTEIn1X8C7e3VGl3jN
neTujAhLNGBm/yt9zZ6C38E7ov9cvKHmRHJ7nneKCg9ClKFPGKyZd8Lu7lMKbek4
ZghkKnTMMBAsr7NODQn4v497BOxcgRMXyl8u+SO50WQJ1dlD/P1pj2CS/uSfsJ8P
/vnM/6odQ8djaByiRr+kFNUlg8eHcEoxihXJIZDcfDA5XaTrJxbPQPi6EjpNPlw2
DenVYXu5
=7lbi
-----END PGP SIGNATURE-----

--CKf/2jVYos1l2hij--

--===============6209820206786444525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6209820206786444525==--
