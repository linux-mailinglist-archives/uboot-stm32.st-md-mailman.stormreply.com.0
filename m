Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA4BD7E63
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7176C5660B;
	Tue, 14 Oct 2025 07:30:15 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0BAAC3F945
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 00:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg8oZ4e5o+EkmDTI+z852eaVQ25fW3BSYri70tJFMSgtBH4Ljb18OMSMLTU331efHt64P/FpcwDzu+xhvQavGu3fXrRmr4fyDUeeJu5wJ4AJtx0LUXB2UzgexFmLsW4Eb0hjYb3v6B1ZKzL3KsBnM7Xe+0FSxtOW18GBMtjCv+y+a5Yd+hTYmtRVfFQOI+FJt1znlTL7VHC5IdHk6wOVVdVkoh3C4H+EItP+RT2achDx6rAJX9Ji4G0XNxhEEcWWoY03v3p7N1W0Ute9uhDaAODex+dO7RgomDwVTgf2CreiM2kkWFYci6kLCBSiJHh52bFgP4CfI1e8SRjhVPrLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8QsqwUUxrVoYzPL8zXhTF+r8Jw6qQJ+mqkppGnZt8g=;
 b=M0/0jz58PJGwVLLLBSCHc+/rLK9rYH+tka92uty16PgP9ntlQ6UOPDdxow34w3X6x230gJD+8Dplsd91+aaA0xVquMnSA9W8AfiNWCyA7ZNruOGU5EkSB5HUdRZOZAWSowDOAS6U6ZI3wBxkC7TWb0nAqK//xDG7jIGI+ZaGEytM2KDJVuzUmKEP7PUup6ltv30YB5xvMRp8JwRtfbOwvA0ZsXBZ7+YdAAUE9OD7HpUqD4mDkOyhEqaN0rT7gzH49chBMWdicCNzrffLia7qn5m9P/fh0HIU+lWvGroilQuMICDa3f3CCFAF2XePgxCSW8BwUzQj8T00U4q7s+7ECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8QsqwUUxrVoYzPL8zXhTF+r8Jw6qQJ+mqkppGnZt8g=;
 b=kn8ryTFwM66S8+cGOHaWwKV1ObqgYSsCFL80zuKXwOQuLHEKE3WyF2U9xFyhUDkoL4MvyyYTuwPZOqPldSYVoyLlkujVfZz/O8ZR9dUHsjGt+N4JiR626pZj850xrKSu8RDcnKFVsaMl145xIShwhb+uPO99ZtL+P8OsynIrY10NciTr0cTvMuTeF6KJQJCdkl2j+TgoN+ElN1Sh5HVt04sj4rLPzEg7fJs2vhEeFpndEAQ9c8Qnx3h+s9dxXZkXQeBOiwBY96+iWlL3JrEz+YxU84IiqZjcRdbbHekH5f4KcMPJj2nmmRjyOr4+hgAOsPTYPpnl62cPaOjYKYU3ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10450.eurprd04.prod.outlook.com (2603:10a6:150:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 00:38:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 00:38:31 +0000
Date: Tue, 14 Oct 2025 09:50:37 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20251014015037.GA31468@nxa18884-linux.ap.freescale.net>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
 <20251013-imx-rproc-v1-6-fb43a3fafcd0@nxp.com>
 <20251013155546.GJ6113@bill-the-cat>
Content-Disposition: inline
In-Reply-To: <20251013155546.GJ6113@bill-the-cat>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10450:EE_
X-MS-Office365-Filtering-Correlation-Id: 1825bf70-caea-4447-0575-08de0aba0013
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aujeiGgmMUcl22VfgYdvwTjElXfT0jPoccVsEv582Zndd6a3ZuCqW250Dl+r?=
 =?us-ascii?Q?c0b3G8HKvbgfhVomWpJYajtKYsrOkOjbjIUJO4Aklre9X2SDdH664UGx11YF?=
 =?us-ascii?Q?hK3+kNPh56TisZnueWGvnoDA3lRDs7N474+GT0eZlgKSnoyelq0Z+neAkrW1?=
 =?us-ascii?Q?Qu5oJQQGtT2t0mqXa1NfTzfDAqNkB5ATKczesuGQuYg6wTD932B6d7nmQnQ1?=
 =?us-ascii?Q?EY7F/eSVKKrHuzYZ44vySFoctVYRacArs3BoxbRcY5eFRqCoQCHbH5c1EAeG?=
 =?us-ascii?Q?Y+oY0VLmej6iHtx4UXYkEJakWAOXdFfkRSpJuSKT8VmpvPL5u04+JbxxHZzl?=
 =?us-ascii?Q?Ns+HNf+D9E6ZYrvYRtL7cdw05JoKGUcOfX5orYv9aRAwzsROeTk/T155UWQy?=
 =?us-ascii?Q?b1Cz+jLv3gQ9Fxh6gigJDjqLDCevxgzvSK9+n1OT+Qcnl+syrWMGKmilQgag?=
 =?us-ascii?Q?MjIR+Is7HKjrStytOW491Gt5oE9Yc2iuJ9rxJmPI3ntOnbjL2oOxQ846re/E?=
 =?us-ascii?Q?ZK8oyj6Z0BspultQQoYzZxUEp2G5P+fhinBKrZ7xm/Z2ifcv2KD3HD0c+1a1?=
 =?us-ascii?Q?FarVk19f3mg3KEMNMfH6shdwpcXQR5Irb8kl5kXXjMl88eiinTFSJ4WxXcGw?=
 =?us-ascii?Q?NGlGnMhP9EsQcWDGqsie7iX1e6azS1fXpd7ZW7ef5RAlatMREPn64U9kbjYn?=
 =?us-ascii?Q?AgE+zBRLvmZw/J8+FMJ0f4CRStY25pb0l3eGubO7l2yTHvvd7zjp+44SNWHe?=
 =?us-ascii?Q?C7d+8lihmGc5Wcg7fkrs8/hNgU8iHmtaN6CKdNVtO7v1pqQjcUtxFChFp+tg?=
 =?us-ascii?Q?8AQm/qie+Kmhn1/E96Trl/Fp7FnVdxRYIXjFKCDk9ePbunGwXMHDptFftRb8?=
 =?us-ascii?Q?+klrv0vM37CV6O/OrIVJgYnvuCnutI4XksuxKuz/S9h8GeIr2b/Dq4ztHIm1?=
 =?us-ascii?Q?4WpJoq6mupC4TKCm76C4MmnWf63j9xIv2Xb8jauDjt7fiKZYVkqW13MJxILv?=
 =?us-ascii?Q?i3R48CHwwKW0pvr/bKM0jsJiqt3mhQxZI3FyE5yFnErynQ6J8br5lUZzp5pN?=
 =?us-ascii?Q?UX17MphoL6XH3yUpfpYeZjlVPZlL3vFYW2YWOybL7xnUjfg7sLAOh93CSlip?=
 =?us-ascii?Q?BRuuTHrglM/y+OTofNNJUgCmDrsR7qinMavAJqU/MIuMsHpB9hEliL/S37eG?=
 =?us-ascii?Q?5Wr904qsg7ubmJtW5T2rJWB1QaE92Gl22NbbnnOTkP0RbaCCdFOiLvFJkou+?=
 =?us-ascii?Q?fdRvOKnfib9KDFQU+dJ4JI7PkOVPftTaTVAFhW/js6K8IdNPYQ81neWsEN74?=
 =?us-ascii?Q?o1G55nvhBFJb63K9i/1xah15xTjRLAt2OyRzXZuQbDBW4ssSOzwcVQBxQFhV?=
 =?us-ascii?Q?iQnUZEhcoOm5Hx30B98FbiC4zgdGCznAiriyvCsD340lZcDL2k4CqBZjpIYZ?=
 =?us-ascii?Q?BRYUn3s2IWKwU1TgO+KYa5vk+rHbu68xC/gQ7e8cZnfITGFL5+VnmvluEFaY?=
 =?us-ascii?Q?CHosR136BL6FhqhCpeXJWpR85oT8GpEijrnv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rMLpMZkJZWq5XsJYumukeOzvzRBOqYCw7d4K3TcZR9JnBA2bSfZ2T+W/VYqL?=
 =?us-ascii?Q?FkSSKO2uJoGA/Ch4s6VhTKrYSsGnY4d/VldYpZwZkg5039WLa53dx/0+lDd9?=
 =?us-ascii?Q?9/iCoQfI38xZj/xbyrl+qE7wzHfmXt8PDJH9IIWBO4RCGfiJG66AqLHMJZFR?=
 =?us-ascii?Q?khw88RH3y8feBCrboLJ4DkaLKvkNgNHiIoJCFXJS7bS8Q9omEkQ4tLHtaKc6?=
 =?us-ascii?Q?PagqNsqDfK11oNLfkd90sNGYY7rlVB5aCW2A5WfciMraCK53FcqH2bVGKYFr?=
 =?us-ascii?Q?A8p6cFXupB73CxoOlOtcBJGfJKmTmLDyOPfsjvpwuZXQQwxUte4kaW6wDyRm?=
 =?us-ascii?Q?AI/sugj4oBwGyt1k9SJDuFEWF/lYOIKzSG54MkXloNIY9RXkH2fGcQ4lsgXI?=
 =?us-ascii?Q?DHm0YNYNbus7kmpldXmINdwAYMeSTrl8qUgTnqmfMVtYL/GUjw9CosiqJL7d?=
 =?us-ascii?Q?M2XECC9RsoBpYGyqSAQ9IwEqGRnDjY8P12tCYklNRsxwD36E//EBlcthIOOp?=
 =?us-ascii?Q?gB779MQBcB8QgEyuzHPF7AN97xwY52+EOCvjw3k26C1iKg70dbiwuiulnijU?=
 =?us-ascii?Q?sN/pO8+qYLQs3RFEZakgLZiHung5bPbxx4iQaXynGvZnnAsJ1ohJVOaeMMXO?=
 =?us-ascii?Q?SYR6VRwiMMRdfsoxFeQYMv4E9PmlVuGiX3XF/ynrWSAGiHRiQAhxPU/JKb8v?=
 =?us-ascii?Q?Sh+OI5O4AqXlG1wxB8Y+Wat76VJ0Q25RlxFDjTYtCLZFqIbZ6uTRikAtgvhK?=
 =?us-ascii?Q?zC9xVOixgKU/CX5asZWKEtq2LrJV+siOhH6uw263GgAS7KMCtbIqVgUK6yx+?=
 =?us-ascii?Q?OnqhPw1hFjZOcZg1ATyeWJyIoE3iY5ZbZrMC91p17zxA8g/fiT4zAzfYfHA9?=
 =?us-ascii?Q?WTNzXK7Bnl7L9g8KdfcKOsjmqFKNfcMw2PujLFmPN9YlSDkW4vIJoCVLwDxO?=
 =?us-ascii?Q?M/zTooOaKQigOZus0uKwePTzZ0qecAnTIiWEXW/LgANgwAIJxpYtP9mCTkba?=
 =?us-ascii?Q?yOa4GnO3la39kaqkf+v3YX5GVBcjgxuBSR/ibfNvlsEKWjuJqqxlBYB3CCDW?=
 =?us-ascii?Q?vZ9rNu9lbUSEWFqnEoXCOIBO8of6avhGGKQNloOHyk+OurVhrERvlawhf7r0?=
 =?us-ascii?Q?PzYobb7ZKuxnViRKi/qxjoskhhB/C3TbpZoHsDTzTKSDOayzUdtilmV/tqDv?=
 =?us-ascii?Q?1dtDkrl/xH5bnXmygHwIhcgiub2sCbyxD1GYB/m5yj/NtGaXHCWxJtN7pVrc?=
 =?us-ascii?Q?6XhVqaj2CEiPGGfTiieJ1B649LSvV7gGiA52by4JQgL0los38ruYBnRNzmAV?=
 =?us-ascii?Q?OQKChwu8rMZtPUEfYcBqMzBBbIF8VQzNCHzFi9CTnxdz2fk2KwfkTkEtj3Ru?=
 =?us-ascii?Q?c94edV4GD6dlqyWaFqwGWceMyOQN9LdVkcDR95PZ2X31bTinPHC+xynORswW?=
 =?us-ascii?Q?ezDLu2Z/CUPS7crauRSOyptdo/0NM+gOCz4DbSeB/r/17/tyEsGFQtNvOtqn?=
 =?us-ascii?Q?L18HNgK827LJmMVRGY0S+KGKpSiuAezPc/Pw8LxdkiVylYMI627eaoFcJ4j8?=
 =?us-ascii?Q?oDng+Kq6DWAq/QVlajn3wZZxk2GgUxQM/IciuNIs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1825bf70-caea-4447-0575-08de0aba0013
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 00:38:31.8369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XG/9TJ//MgDTPTCXngoeU20tkWRHa+RqObJyWakhlw163H9cxY6ZMohcwdLHXwVwAkrSK1N79bxc//R9rdnKRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10450
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:14 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Ryan Eatmon <reatmon@ti.com>,
 Andrew Davis <afd@ti.com>, u-boot@lists.denx.de,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Hari Nagalla <hnagalla@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH 06/11] arm: dts: imx8m: Add remoteproc node
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

Hi Tom,

On Mon, Oct 13, 2025 at 09:55:46AM -0600, Tom Rini wrote:
>On Mon, Oct 13, 2025 at 10:49:25AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Add CM7/4 nodes for i.MX8MQ/M/N/P.
>> 
>> Reviewed-by: Ye Li <ye.li@nxp.com>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  arch/arm/dts/imx8mm-u-boot.dtsi | 4 ++++
>>  arch/arm/dts/imx8mn-u-boot.dtsi | 4 ++++
>>  arch/arm/dts/imx8mp-u-boot.dtsi | 4 ++++
>>  arch/arm/dts/imx8mq-u-boot.dtsi | 4 ++++
>>  4 files changed, 16 insertions(+)
>
>Why is this in the u-boot.dtsi? We have

I am preparing the Linux dts patches and will send out for reviewing.
Before those lands into Linux dts, we need that in imx8m*-u-boot.dtsi.
After linux side done, we could clean up the imx8m*-u-boot.dtsi

>dts/upstream/Bindings/remoteproc/fsl,imx-rproc.yaml and so your updates
>here should be compatible with that, yes?

Yes. Per the dt-bindings, only compatible is required and that is what
this patch added.

Thanks
Peng

>
>-- 
>Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
