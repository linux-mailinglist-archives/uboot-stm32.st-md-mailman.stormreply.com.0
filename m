Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3713A2F8DAA
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:22:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD2E5C57190;
	Sat, 16 Jan 2021 16:22:20 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1819C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:22:19 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id z20so8349033qtq.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ANHG0CH5/enJNfkLltScoLIw36/jEYSLzkh95ji8DVU=;
 b=Zg5tdj+am6KJSH5Gcihj6QyZaFLb7xvWrUKQJF/0mxYkTu2yg/Df1HK6bDpaSt0+JA
 9udpidMP0BGHBcuCPYMoZx1J5UrOhzZccJAPj9JROIS0lyKZtZRecRomGSa30xMysTNK
 9di+uF1gPAv/IKafGNmlVPBhqjwU+DfZbPTzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ANHG0CH5/enJNfkLltScoLIw36/jEYSLzkh95ji8DVU=;
 b=f4fS0YTOBMO8qAlDVQ9G2A+V2BKRv0GB0QONbw4ot3bUZJKlXQzHxE+cs4H96pj9X9
 lHb0S+2BOoz6pCUzAxzVgVrEaN1NTq7xmNuwiI7aPU2thvdu8J56CUOMqwb525ZPrbct
 vWugy+egeOR14ZInLyYFY3omYR9PBjePKHl4tQVsyMoWdhPP+AIkYsM0D7wXIcF0e+Vk
 PKQi9q9ovwZkFzVF5HGhkCKyrqGXQnE6lOvDf7kam3kXYu0VGcsUGzjBOiG6zurXwf1Y
 myciXMsQdtNJoNkj6HsaPhWhQe/hBKgSHecePg2/RvDnh0MbWiMDMGCMxZ06u22+drHp
 0ZZw==
X-Gm-Message-State: AOAM530RI0N4AR18qdauvFZwStCLydOJGfdwbw6cuUqcIoAh2YHXwXi0
 WCHzHHzPTMnOn7WfyRqpHfpvxg==
X-Google-Smtp-Source: ABdhPJx1pgppSnIl4bW4p6JY+V2dPQ7j8iA+Oz4G9mMDKev6/3G8zHQmV9YCCG1rl8eIfhi/pYcbUw==
X-Received: by 2002:ac8:7349:: with SMTP id q9mr16552679qtp.259.1610814138813; 
 Sat, 16 Jan 2021 08:22:18 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id w187sm7310593qkb.81.2021.01.16.08.22.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:22:18 -0800 (PST)
Date: Sat, 16 Jan 2021 11:22:16 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210116162216.GS9782@bill-the-cat>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-8-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201127102100.11721-8-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 9/9] log: call vsnprintf only when it
 is needed to emit trace
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
Content-Type: multipart/mixed; boundary="===============2153460730293090902=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2153460730293090902==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hEarWVD7htqb1VxP"
Content-Disposition: inline


--hEarWVD7htqb1VxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 11:20:59AM +0100, Patrick Delaunay wrote:

> Reduce the log overhead when the traces are filtered,
> by moving the vsnprintf call from _log() to log_dispatch().
>=20
> This patch avoids the printf treatment when LOG features is
> activated, but trace is filtered, for example when
> MAX_LOG_LEVEL=3D8 and LOG_DEFAULT_LEVEL=3D6.
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--hEarWVD7htqb1VxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADErcACgkQFHw5/5Y0
tywljwv+MLOgBzKUGcUoaCpmNddcNOqRoejd9uIvFe9v3aOT+YgqALI+f1WhSkfV
BvI7g66QnaS5/0MCdQmfWQJZidnBywnTMyYfGuu9t+NtJ6m0722lkNzXSzKQSHWD
wqHtRVQq0tDeszbFK3Otm/c7DdAHMaY/QsnGQ6HVamVpj+KU0U98fwVb0cT7VWzC
3c4Dv7pFNN/MWlLBRiRMQ332YzuQ4Iq5oSugGK7hsM0Sk2nB9/u1yci3O2uGd4/j
909EE+YYT1C0gbNO7VgadR8doNG/vDLZJjR8D76Z8/jniHZGeBtL1g2UnQzHgDau
K+ac0JVGfKuLW5z6Kt5BqfQCMKaEcam1Q23HKUD00D18e83i3igB0owT28qWTxKF
JGGwmwp0LDs9/ID/ctXjlquuA4aYL2cqAf1ShW3fjmSUwV6aCJLKMeN5TAgqK10r
U2Y8X+xbvubKMSmYvJ/PwRbLzbt3B1qDfZUWwWnfRmJj+nl78T8JLo6vWciqFeCA
UkdV3YRr
=XyHJ
-----END PGP SIGNATURE-----

--hEarWVD7htqb1VxP--

--===============2153460730293090902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2153460730293090902==--
