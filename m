Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2740122ED62
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 15:33:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E71B2C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 13:33:32 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 772C2C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 13:33:31 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id h21so5756929qtp.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=q1DC1sTp7nCRdbGiX9GC/svMW6yAexCH1MvtpKiB694=;
 b=ovKCp88TWnIDFawbZcwpodK8uv+hX3fOf6UHwGdYwA0ppJYiE6WSGm7N2iklZNREEI
 ZMjBn0wNALz67OsM0eGM1IxDKSI/qqphqOLqMBS5Zbc/osWx4ulwPr/yHsGI9OVYmU5m
 jmoh3BBTGiJ2YFEvrH5UE2oSqyjzwIoL/HHtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q1DC1sTp7nCRdbGiX9GC/svMW6yAexCH1MvtpKiB694=;
 b=PrHTz7OMUIwulapnpcYRU4JGA1Leu0JeMM8d6qy4eCZvplK879qBEedYFa2x8m02EZ
 4rRsaZhWzITPUWn4u9WnFjHvag3dIdWlUvm5mNBTk/tBXSQQVpLv/pYokXMddvM6jBcs
 lpWwUy9ZLFEMtrvWxaQZuuTXJhKjgJNNzuJoLyXb1AqkPoIGI7ahkGPkvSsAb6hSiwbY
 Z9LChhtAHvFddIXXgdYCs1BZdDio2U227sfGmlUOZK4WRWXy+fsksnlkIpQ3pKlimpoI
 Lc/K2c2PLDV8PvuWQWc8wQjE/HUUu7A8YU8Bq0UqtyLW4AQiYqie8659lEAY7JI5B1fR
 6ycQ==
X-Gm-Message-State: AOAM5315PmTAdr5wfGHg2+Bo8fOd6fU+J8vrfPTM+hOSt5Hg0DPmDwza
 mWN2jYp2ABAO9Y30099JecOEDw==
X-Google-Smtp-Source: ABdhPJztni7IQxcTOhQAaIeLwXjk0vAKo9pYU3sHSxGSM9FjlX0AGpiqm5k5UPhiz/Oj03xdlb4vYg==
X-Received: by 2002:ac8:44d5:: with SMTP id b21mr21909583qto.261.1595856810443; 
 Mon, 27 Jul 2020 06:33:30 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id m15sm12579484qta.6.2020.07.27.06.33.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 06:33:27 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:33:24 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200727133324.GJ6965@bill-the-cat>
References: <20200619120337.17042-1-patrick.delaunay@st.com>
 <20200619120337.17042-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200619120337.17042-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Anup Patel <Anup.Patel@wdc.com>, Leo Ruan <tingquan.ruan@cn.bosch.com>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>, Lukasz Majewski <lukma@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [RESEND PATCH v5 1/4] cmd: env: add option for
 quiet output on env info
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
Content-Type: multipart/mixed; boundary="===============3753616753284103251=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3753616753284103251==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HuXIgs6JvY9hJs5C"
Content-Disposition: inline


--HuXIgs6JvY9hJs5C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 02:03:34PM +0200, Patrick Delaunay wrote:

> The "env info" can be use for test with -d and -p parameter,
> in scripting case the output of the command is not needed.
>=20
> This patch allows to deactivate this output with a new option "-q".
>=20
> For example, we can save the environment if default
> environment is used and persistent storage is managed with:
>   if env info -p -d -q; then env save; fi
>=20
> Without the quiet option, I have the unnecessary traces
> First boot:
>       Default environment is used
>       Environment can be persisted
>       Saving Environment to EXT4... File System is consistent
>=20
> Next boot:
>       Environment was loaded from persistent storage
>       Environment can be persisted
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Tom Rini <trini@konsulko.com>

Applied to u-boot/master, thanks!

--=20
Tom

--HuXIgs6JvY9hJs5C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8e16QACgkQFHw5/5Y0
tyxX5Qv/UvqjPx5SszCZX/YGaUTSpgLzGW3qTAcErv+ZpRrcJwKDhvByDnANH4SY
s4qImHws3+UXLA7FXnFADenqkW2ofpHcbi6n5AG3xzplUZV1orr4hngo91vg+84g
PhR/CioQB8BUSnqY368hLe7tpq4F66IsEsNIFobYmlaG6vzMuZ9SyMlaIO88bPdC
c6lUnSHCK4g7gd5yEthgNRfDVtreIpDOkzlPKJJPpklFRjK5HVTT1GdhXTpvxhtu
fxm4eYS9K2VsH25GKteX0GgmktVIK2/OG7X9dKedZPiAEV/2r+rgRsBSCkzCmrgg
zkJoxleRzWUFXjDWkCqWYUy7EoBpy+qlJK0owoYVbRjtntrgKeiN+QykjtgVM3LM
2Jjt+UwEo27vwIbCStuNe+80Tb1SLmsUAjZVp60j+CGycAFipuLFM1UT7EG0RnqN
ceaWRi0SpXKCtkxnwMOyyoOuHXR16vZFInL56u8vuq7jgiJHjUfuUylMYFQBaAo4
7iJFGZ36
=gNbz
-----END PGP SIGNATURE-----

--HuXIgs6JvY9hJs5C--

--===============3753616753284103251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3753616753284103251==--
