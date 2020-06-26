Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 232E520BAB7
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 22:55:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E02E1C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 20:55:32 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D395C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 20:55:31 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id j80so10080982qke.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 13:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kibuRdGAYrQtgi+fq2tq74hnyZ7yF3t9rZo+dpTMjj0=;
 b=pjMe/0Ushp1ZlUFMMxnd3YYL/PmM6jBjHqxSYLcNMe+8eQ8cXGWiHcgsgSRl0HwuH8
 73uNCpgCp6KDtVLKygDvxtGLgiz1kx5rRkEO28P8XNCVzuu0wOdS3ahML5+yB/lkLWkP
 EBVmh+BjZ16sVl4HF3z04HnsMzsfqkaoZ908M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kibuRdGAYrQtgi+fq2tq74hnyZ7yF3t9rZo+dpTMjj0=;
 b=rc1OzX5h4is2BbTHftciZv9Ov3A9X2euKFWbLXJQSfFNKQ9yRJHfhM5OncdHXuZ3Ao
 X+xbT2RbFILSikDF8a7nPgbQxEtk+HQRHuYLIg3BewTQi4lQGDpbmQqjjS3fggagEl9j
 8LkOLQG9KWeS1BK7caP3mxSbiBwDxZ4NhXiQyEeDlZ1Xmpn9/rD0xUPu8coL6EP4Q8Zz
 alwhZqxOQEQelvDhODXRGinFGMdt3uH94kvR3kxqMjg877C66Sk/bB4PDRAdDjeFO4GY
 fiCFBO8EeYSW9XWhpENKfafR0c45rQmQDihGwY77JpAHCU4sxpShQPnRzSvjBlXINSOd
 KMTg==
X-Gm-Message-State: AOAM532hWaTsXaeTIMkFq9SfQAbkTM2lVnqfUBYGl9QLlSkNpCZ2+su8
 rcdzKg4jOZRlYne/3O7SMncuYg==
X-Google-Smtp-Source: ABdhPJxOB3n5QJlxYi8V9fNV692nQVOPtqwPprpV/rZB26BmDzJ84yrguA7irtJYIFKz3O6c5eBqpw==
X-Received: by 2002:a05:620a:91b:: with SMTP id
 v27mr4598289qkv.264.1593204930184; 
 Fri, 26 Jun 2020 13:55:30 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-bd3e-bf60-4b70-2dd4.inf6.spectrum.com.
 [2606:a000:1401:8080:bd3e:bf60:4b70:2dd4])
 by smtp.gmail.com with ESMTPSA id j18sm4724544qko.95.2020.06.26.13.55.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Jun 2020 13:55:29 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:26 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200626205526.GJ8432@bill-the-cat>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
 <20200625075958.9868-8-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200625075958.9868-8-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot@lists.denx.de, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Ramon Fried <rfried.dev@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH v3 07/14] cmd: env: add env load command
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
Content-Type: multipart/mixed; boundary="===============8022298197997156035=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8022298197997156035==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LNKrWK8T5LDJo+fl"
Content-Disposition: inline


--LNKrWK8T5LDJo+fl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 09:59:51AM +0200, Patrick Delaunay wrote:

> Add the new command env load to load the environment from
> the current location gd->env_load_prio.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--LNKrWK8T5LDJo+fl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl72YL4ACgkQFHw5/5Y0
tywjCwv/Y3zIKli6N6Y74zj/7MgcE14KuhQUdW81ev9EPpS1s6xpgf+e+Brcq6U1
qjdkJiU/kJK2zQ2cW5tXtD/OyJX15W9CFALkr7wLbiXuOTQbftlwDmfisz0AnXj3
fM2PJzNyIjvaxCYaW5V9fdjenIhd8D7/B8CP5leRJ3063/uSvrNiATPs/UX0lNWC
eSYYTzBiMERo4WzVqxHxNGpfX0vrjUvhgrNJuuzpiJ4ZF6GR+4rXl03AvLB653dx
MZ1PQmTsjJT8khXPmgHTvGhdcbJKAj2i9jXjWJjOL4Oobo3NshIzSLW8KO9HgaBH
sIPCQN7RXRlKktWYSzSApF9Hl1A7VV8gfH0noL8VH5I1xCdeauBdAhhlPRMhLURe
lJazRX7yNRWtJ9A9spB51cGkpGXaG7HdtaqPByupiqlj7NDFZknXz0v1Hp3I/2Ju
wap+SPSK7f1zd4F0dzJnshM09KPFu405ZY4tMSo4VE+0NbUODI0nGD6o1VxwuSpi
vU6Tk9I/
=P+3T
-----END PGP SIGNATURE-----

--LNKrWK8T5LDJo+fl--

--===============8022298197997156035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8022298197997156035==--
