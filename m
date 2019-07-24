Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED4678599
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Jul 2019 08:58:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B43EC36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Jul 2019 06:58:06 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130059.outbound.protection.outlook.com [40.107.13.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B21AAC35E0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 02:21:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEydsxlVyedy4tzPWGHGiqpF0iiaEFXpcxoClxStSuH5B0dCTV1vLyE5b8cZ7LNFz6884vQ8CbPHqAy/IBM5dzmlNuSGvwQ4WiekmCLxprhafYBLUAia+bbnpJipV2y2QGRZHJD6EPHkTw5dCoh/bWFsq/BbkTrIAjNhvVaDSmaCbbGRDZsFyOWRNlQ0hA5C98aS6r/yN8P7WJjcISayJelMM9OTp0PmQuMO3qedC2TyBVrmUbB1nLH76wbwA4wumsP9IcwomYzXyaKyICCuotnNPrjwjNosrDJmgBmf+9xksQIUK06gbguVYUktBCnXH+1EWPc/4dEgLjEs+jyMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv6T2537SAz+/8qxGuYJ7fxwlgs2XJCiketY/9++7Xs=;
 b=SM44shqkYiDsioeQ6QLrOoTR3A1td0B1HtJBt0o0vRWWcFADgsRclucRvgipCm7sEPN1313XnOHokm6aa+bkVMDoPQ9aS0xkNXV7bszYodFLFT//5/FCckDzM6VNKz6zPoA51PgJ95MjyHgP0Pk+Sgfrvc072PvSeNmDrOCsBcP6koRXpSd+uuq8IPWzGwTskPaxpXTpwqF3o5crGV+uR2q21zp+RZ37iORX2iuKI6vBkLW3LYsSaKIzvV0f0Cjob9xDQO6SUfuh6F3SeKXR1oc+r/MUbd7oD4o3pzKUc3wItV9j7i5lehVjo3D+QKuvFpH/cRphPwY9SEAl2ApWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv6T2537SAz+/8qxGuYJ7fxwlgs2XJCiketY/9++7Xs=;
 b=WWakFsJNTZok6H2Lk0dqkeFlzLfXMnCwAhQmF6y9ISBGHb8Jnu0lFTs77McdgorLU9Becxobwy9X6i3WWYWINV8Y4+zDoE4KRn3bvS4FSOaG4QyvkAIS7jWHBCsrnwXxO6poidMOWdBaRMumfYA+LwC8F7NAG3gzvrLodD/9MAk=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5538.eurprd04.prod.outlook.com (20.178.113.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 02:21:21 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::2023:c0e5:8a63:2e47]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::2023:c0e5:8a63:2e47%5]) with mapi id 15.20.2094.011; Wed, 24 Jul 2019
 02:21:21 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Patrice Chotard <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] mmc: sti_sdhci: Fix sdhci_setup_cfg() call.
Thread-Index: AQHVQTlzp3zKNqUZ10+Zwm1lDtLyS6bZCmPg
Date: Wed, 24 Jul 2019 02:21:21 +0000
Message-ID: <AM0PR04MB4481C5FF5CC7517AAF41467588C60@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190723093128.22007-1-patrice.chotard@st.com>
In-Reply-To: <20190723093128.22007-1-patrice.chotard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 379690e1-f723-4bfc-9514-08d70fdd9e8b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB5538; 
x-ms-traffictypediagnostic: AM0PR04MB5538:
x-microsoft-antispam-prvs: <AM0PR04MB55380C3668923DEB954C712788C60@AM0PR04MB5538.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:283;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(189003)(199004)(446003)(11346002)(9686003)(53936002)(25786009)(55016002)(74316002)(6116002)(6436002)(478600001)(71190400001)(7736002)(71200400001)(305945005)(33656002)(3846002)(486006)(26005)(81156014)(186003)(8676002)(2906002)(476003)(99286004)(2501003)(44832011)(8936002)(76176011)(102836004)(66066001)(14454004)(316002)(256004)(110136005)(229853002)(6246003)(86362001)(68736007)(64756008)(66476007)(66556008)(54906003)(52536014)(66446008)(7696005)(66946007)(76116006)(5660300002)(6506007)(4326008)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5538;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K2TlDnfHXOmnJNPWI7+KsnwrJg9U2VawxrDjfHbLgtCuiM1ZjTUhjMr0x8MalmxaKsB5KRZ5czu2Ap9JyLYat7Wwg2quLaJ2bOOrvmmkc19TakyGgE2ZMvCXW98YKy5Uf7q1bLjutYBtlwkVWZNWHolpGYafKnqSsjlyKnqh/7QTHrE0WEYA/+ovwWspVj9lEDmOwQQy0qjt3pMohT248nedOWxrcucjL1BXTLrPfdQI6SLUjHqUFKpZasxH4l+8xjJkp/2g4VhA40uoNGc/SpM4jkf6A3mg0EaaAQ1R80jqVLH3CfxpBQGww6440fG7FZOATY+Ufv9nu3wYa+QVGIX2LqP1aVQze272kCouulmQsQ9u7bfevf+jRPgOX7y7JgNadXrp8xifc3F5PbAmCPMxZxa+FcyLF2BE+cUN3ZU=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379690e1-f723-4bfc-9514-08d70fdd9e8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 02:21:21.6622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peng.fan@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5538
X-Mailman-Approved-At: Mon, 29 Jul 2019 06:58:04 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] mmc: sti_sdhci: Fix sdhci_setup_cfg()
	call.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

> Subject: [PATCH] mmc: sti_sdhci: Fix sdhci_setup_cfg() call.
> 
> host->mmc and host->mmc->dev must be set before calling
> sdhci_setup_cfg() to avoid hang during mmc initialization.
> 
> Thanks to commit 3d296365e4e8
> ("mmc: sdhci: Add support for sdhci-caps-mask") which put this issue into
> evidence.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  drivers/mmc/sti_sdhci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/sti_sdhci.c b/drivers/mmc/sti_sdhci.c index
> 8ed47e113d..c7f1947edd 100644
> --- a/drivers/mmc/sti_sdhci.c
> +++ b/drivers/mmc/sti_sdhci.c
> @@ -97,14 +97,14 @@ static int sti_sdhci_probe(struct udevice *dev)
>  		       SDHCI_QUIRK_NO_HISPD_BIT;
> 
>  	host->host_caps = MMC_MODE_DDR_52MHz;
> +	host->mmc = &plat->mmc;
> +	host->mmc->dev = dev;
> 
>  	ret = sdhci_setup_cfg(&plat->cfg, host, 50000000, 400000);
>  	if (ret)
>  		return ret;
> 
> -	host->mmc = &plat->mmc;
>  	host->mmc->priv = host;

Should this line also be moved?

Regards,
Peng

> -	host->mmc->dev = dev;
>  	upriv->mmc = host->mmc;
> 
>  	return sdhci_probe(dev);
> --
> 2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
