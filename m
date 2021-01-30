Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD313097FE
	for <lists+uboot-stm32@lfdr.de>; Sat, 30 Jan 2021 20:20:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87EFAC5718B;
	Sat, 30 Jan 2021 19:20:56 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 056ECC56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jan 2021 19:20:54 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id a1so6185417qvd.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jan 2021 11:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ftjWdG0LyTTdzCUPKAZ8Y7VQb2tc4QKcVNLVPgzeWCI=;
 b=e6dboUk/CqpibwXAbrz9qy7Wj0/ZFq7X6pY9MRsp6NnDWg+Oi0zUokJKTXMcoZZwkV
 ycmIYZa7EuGXRVjse6wCKo42kmHOLgYiX1tFKbb8WNKJMZnUsvTSb0j66i8JfxbahLns
 U51/Odub19zOJGvSwracYbRqzOMOegPubsmE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ftjWdG0LyTTdzCUPKAZ8Y7VQb2tc4QKcVNLVPgzeWCI=;
 b=eXLIFtmrfFZOSP/hWefqHumdmzRrydaHnd29/QTcVrWZngRZyCY+Vm7duQLnQF9dPr
 Y1gB41oHfrgmScS46WnedzKREvKfp9zeMReqOIH3Y867QsgzNk8U6B0gJ0lq8Hd4AJB1
 m5UUk0qDPj57idZstknJs2E10C4mQRHavMtgfQ1Ww6AsWdvj+YELWxMtZCh/a4Ee30Gi
 uG+sp3neEYQxZQWuHPh26XEcPMOPdqxvzW5ZYOKIXeyfKKSjFlMvji6wIe0Ysn4lMA1+
 xiagQa+xhbTTCU94nS7bUQIFx3RdZTph/1rCSOLhOC7QT3dgOPN0sug0gZAuZRQp3qdB
 cCyQ==
X-Gm-Message-State: AOAM530BcX3dibUrcp+rlh3RsNO4+S2PpHpAuJf2MMECZ9nMpVd1pHj6
 0MmZjYHlWTE8EHpqnB6EzUqiig==
X-Google-Smtp-Source: ABdhPJyXYH1ygOLw1y0jgX73JW5xP98rK4hXIberlyEjVg8jdITAWjPBIllwtJWMc5PF6DPRkSWAqw==
X-Received: by 2002:a05:6214:a4f:: with SMTP id
 ee15mr9272442qvb.10.1612034453215; 
 Sat, 30 Jan 2021 11:20:53 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-baca-3aff-fe98-1abb.res6.spectrum.com.
 [2603:6081:7b07:927a:baca:3aff:fe98:1abb])
 by smtp.gmail.com with ESMTPSA id o10sm8631889qtg.37.2021.01.30.11.20.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 30 Jan 2021 11:20:52 -0800 (PST)
Date: Sat, 30 Jan 2021 14:20:50 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210130192050.GF7530@bill-the-cat>
References: <20210104144122.1.I2b5520b2a38d073b87acd144c15a1d2ac0aadf51@changeid>
MIME-Version: 1.0
In-Reply-To: <20210104144122.1.I2b5520b2a38d073b87acd144c15a1d2ac0aadf51@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] env: sf: cosmetic: remove unnecessary
	space
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
Content-Type: multipart/mixed; boundary="===============6765711936484765727=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6765711936484765727==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9hZHAYO2zvu+KBwy"
Content-Disposition: inline


--9hZHAYO2zvu+KBwy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2021 at 02:41:31PM +0100, Patrick Delaunay wrote:

> Remove the unnecessary space before the 2 "done:" labels
> in env_sf_save().
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--9hZHAYO2zvu+KBwy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAVsY8ACgkQFHw5/5Y0
tyygqQwAmnLoNaErqOucxoR6q8nb86Tpf0UmOLaDpfSav+zaiLtV5pT9CxsQMVCe
XNibA6aXBPq6mGqn0gXwsfa1b48GDst7CcgxYVOMivh3fh6NbCE1u8UH+PaV5XLI
AZFYgB04ZlhKxqmcFAbup68mTvbZhWKLfemvrYKSFsf3beG6KAXfyuouJ/MSGAZb
4diTCECReuHMtClxJD8SgABecJcPs8OxsWoNkfi+/H99gAdv7ezxYi2zWoIUUWyw
oDo0ROkaUmLqbT39WQF8bbAhKm2lOh2eExAKc/L+p16T+Grf6yZDPYxuchX9v8k1
mA9FXfN7rFbGyWId1BNsMh9NqqGX0z1nldNm89pkpHNu7o+aQgZ+fbiB/kjgZXte
/2030TWmqeMEujdE3+HyRweUEub0KwGbZqz2YRhWhcGyrCcJIEXBPMC/ZSYd3/CG
y1omTwaDRr1Q1uqaYyIHXa5c/nL+x2gWysY7sPrF1GuGCo+dUT4qAsMQ6JkAaPmR
5aEzejhC
=gjcx
-----END PGP SIGNATURE-----

--9hZHAYO2zvu+KBwy--

--===============6765711936484765727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6765711936484765727==--
