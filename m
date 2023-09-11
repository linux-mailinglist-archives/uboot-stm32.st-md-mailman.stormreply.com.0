Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A99FA79A71B
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Sep 2023 12:06:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C07BC6B46E;
	Mon, 11 Sep 2023 10:06:05 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5695C65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 10:06:03 +0000 (UTC)
Received: from [192.168.192.146] (port=39656 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1qfdno-0002o7-Jh; Mon, 11 Sep 2023 12:05:56 +0200
Date: Mon, 11 Sep 2023 12:05:55 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <ZP7mg3BKzzLf1MI9@nx64de-df6d00>
Mail-Followup-To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
References: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
 <ZP7PeFpJzneU2h9k@nx64de-df6d00>
MIME-Version: 1.0
In-Reply-To: <ZP7PeFpJzneU2h9k@nx64de-df6d00>
Cc: u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/7] rng: stm32: rename STM32 RNG driver
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
Content-Type: multipart/mixed; boundary="===============9149161895350718477=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============9149161895350718477==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XPZou0uhzQwwXo+q"
Content-Disposition: inline


--XPZou0uhzQwwXo+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 11, 2023 at 10:27:38AM +0200, Grzegorz Szymaszek wrote:
> [...] Shouldn't the "depends on" be updated as well?
> ("depends on ARCH_STM32 || ARCH_STM32MP", like in STM32_RESET.)

Forgot to add:

Reviewed-by: Grzegorz Szymaszek <gszymaszek@short.pl>

--XPZou0uhzQwwXo+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmT+5oIACgkQeE9lGUIc
pz52hw//cy7gRdhcBKImyfMrdoOLYIdYSAkRlQXaU7tQOvmLHX4uRJ8a4K40I4Ex
KyLScCwigP3Y0qjuw3o+3aREDaCNM+4sVpPB7yHnC4PoMNSAMQpjVc1HtELV4d1v
z3wZXg3kJYeSa5TEjGmLK5zHK2xxhDOCtCCPRYImlV+Kv1MkWOZrUzjeYtgGufky
lTw23wuXz+S5A8FnR992Y1C35HL2dZpMhRdTQAz2LMDQH2zHCRo3+63DLHKZqg5a
efqGF2BYByHU/mct6bby0y79lyWFykCqKV/cD++YXTVuhJb75CMSdf1yTfjs2n3n
9q/35/Yr7bEWkxfnLngz4dlzVVyXB5G1T7QhejQFsC2DBTPG6+MltTe0G2nEoi2i
1HMJfGfUMhXaaep0LiqjtyJ/44Nj3ExH0dGD+gZONeKGlvwB/fbPNSsopu6H3gAJ
m2axlEUR+JBtgoAOv3OGfb7gddCypq0bx2UVdsyYhDF9qvVb5qxFRYNmlfVhTkZW
zPqWmFGpDzgbzMQL+HIUT0d5owERDR1UrzKEIH1pTuOqYk8o/Z934W1uepQtvWZh
1xDts8vq2+21sKvpHJcL2plzHd4Os9heNpu3vZetA/gNYW4dDHiyi596NkrNCdP/
c5l9l23CwrvhmjKOtctYEfYz3qTkolJEk+Q655C+lqCkDalqAOo=
=VbqD
-----END PGP SIGNATURE-----

--XPZou0uhzQwwXo+q--

--===============9149161895350718477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============9149161895350718477==--
