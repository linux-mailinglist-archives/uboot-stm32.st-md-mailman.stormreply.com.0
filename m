Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEbvLqznuGkllQEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Mar 2026 06:33:32 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C002A3FDA
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Mar 2026 06:33:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9409C87ED8;
	Tue, 17 Mar 2026 05:33:31 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA5D6C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 05:33:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyWlPdk9XfmnVIF7Ceoe9i0LnWrrN6cqYLMT9+GHNMjw54GQF0Djk14sOzy9L/jtJjaB2YWueoirJOuvLswD2VgEwq0Tkr5/KMxCrOcEU53MtFON94Fr1X6fnVnx39z0vEc3/85IwHupgZy+A+3Js6FXCT1SAHSGmEgWYxSUgHk9Vx7gjiTZ4kw+kPuq0SAdlsHsHa+oatI2MdL5qtKZwjMjN7HEUVLRSpZZur9021WZupQlAupma4HVdYBKMAyCqVGpxLhPQ5czmEevKZHo0884aex4hWURDFWAJYQ7ikGXRVv1ryRKMnRXN1bhLKo9cK+dP9BLCcImUfS6Ts9N3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9NQIlirooLTM5EKrhgIm9GOmOZVZaOHdsxk7w7lczA=;
 b=fjug5cn/NqmbAt5/XFq05VklISBP9bUjY2wERy1KUPK2u2I/1FeLOuV81EJEcla5vUWCVhsgycXosXIVUp1J5tfoPPIjW5etiFkW4+cV0ZfBl4/6Q+xFfo26bTGIB60/Ywv+ES+iuFAywZ51Bh80PLRazE3OKk+T5B58spRJujUTfQt6D4+5sWfN0gVsVJB/SX4ALlqUhShDXf1i5jYGj88HWyvD3lLwRC6J4cUk3U7y/R8+5S+M3bzsQ+6y/ofBFE79OJqIgpL6TOOog0EFocR73WJBEZAxBxtWF1yVH4nBRvYp6Chkm3890rC/Wnx60M5UswsnzLKK7ct5/zoChQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9NQIlirooLTM5EKrhgIm9GOmOZVZaOHdsxk7w7lczA=;
 b=VFUGYWBMKOm6C5bLLZiYhArOMyM5doeubxm2khkiE2uw+5NKowoFgmvQC/cbGST8vXNpMjIbTkSDcQxoiXG/TJVjZ1rC+cLbZPgZDP4gi0wiGbnX/P/AawBv0wlYzXUB6l6hB5SY8FsgFcSEQWHBokp/LkM3iVR61f267+062RTZjPmED6cRTnbBJGSn0mNJkbafe/n8iePhRcxfN9X7YA3qgKmKKhNLBmv6p88C0gWNLP6jAW8zrZ6+FIo3J76uOXP6N1ESBGRwlNQ6m0hR517J2iLSAUgu1uGNw9LDnfLj4zbdjaNnWPjYXcnNA6dBnMv+qIc8kTzQS6vX0W5+Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11779.eurprd04.prod.outlook.com (2603:10a6:102:521::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Tue, 17 Mar
 2026 05:33:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 05:33:27 +0000
Date: Tue, 17 Mar 2026 13:35:34 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <abjoJg1hDb9yOueu@shlinux89>
References: <20260317012414.4162304-1-trini@konsulko.com>
Content-Disposition: inline
In-Reply-To: <20260317012414.4162304-1-trini@konsulko.com>
X-ClientProxiedBy: MA5P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11779:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c53e8b-0472-456f-fc54-08de83e6b728
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|19092799006|1800799024|7053199007|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: mUAlLAnt2fFLsOXTNRHawvWgJGk/dnU8N3n0/L1Pwh1lue4xq5lrzWAJVpdhy0yryZO1mAB+gm6Up1wZPDqmbCDehuSdwCDj7/Q8UDVo/quj6dg49kNCP5uVpgVvzD1DieOx1EMiWNbAE6M+5SP5pKPq9OYEE98kbDTkYfC0oEEcL8qKylVDqPcfNxzP34eDYR9aLPGjHlu5OpEoY9JjTtMPPMTpUF0d4rnzaWJ1/Purp9uqololvaMYl+S9cI+2IsViW8PhQG6AJtBcTfUiMGia5yIbY73yQrJxULdAAxnIEGlbNCXYd6aI91kiLtuCrJrnn8T4cCHa90AGphtBSfUFr3KH8defy9Bzd+W9KkO/YANjiyB3mLTXw2uEpf6plMXMfg+A789rbLAlgAJLgYqOGfE4D2ejgfybGimCMtH/HvrDhcYY+Nyk9sAo4d+i/H/AqG5s9N79xFu0jRy1mZluMF/ZASS7kc7DYW2FIHHtoHE8JBcBrQUFf5Lyz6yvxezU2eJYR5FDiJQxdL+Iu3ExEtZ8azb2yugTy67VISI4kWaAiuhH4JwooX183pS2jn3bkGZwuPS9Ogv8Px5FIr/tr/1ZQLr2RIBR1C4Nbl/LMmh04sVqRG25mTJfGIibX03Oj6RJKEjHRon+KJqyVu6vQmi5Sl/VMNaZB6Juw632JTD1HM3B4uNgqNtOxk5bx2dH0sGd3IOyoqNM/CUR1CJDnVnSpSapY5F1sJLEuipWfT5hqzYE3ITJqIArKKmDaCR91QPzDllctiIjh5jjuW8y8ZHcKn594IAMJjvtFJg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AR0Aq+PXsTB2nsE3zD+cYO6AGvtD0clI4Wt3uXvrtkMdNV2FJoROaryRBTb+?=
 =?us-ascii?Q?pW7Mpo+2iGfgMGQQnmZ5f7lKuMvtwdmPGoqhW0rtZPOQK/g8q6vGbMrjXuSa?=
 =?us-ascii?Q?gSgTT4gJvDA5vHfdmb7MMxYfYf+3madVIal23gxxP5TPFeL8fQD9toIC8kLK?=
 =?us-ascii?Q?pVAolBckVSNh/r/TFo0na6Hf8JqbUBajYIqiKxpXUJnONiZ7n7solpJNYnmY?=
 =?us-ascii?Q?WNqK5NSUZ/HcBWt3ssJYuZZNrlGdU7vjs4R6g16SDeI22v1dt6XTLZAwgvpY?=
 =?us-ascii?Q?m4GQ9xiERy18Dn6i4EuZCVaiVYmKZtRAn2H/wthxslX+zCAdBo9h37RVjJZ6?=
 =?us-ascii?Q?ydI2DFlJijW7YjfTrjZO32QqLH2jAVQT+LSfDZdNgWV61mGxRoNl7brtpAT7?=
 =?us-ascii?Q?GJHrKsf6fxBNoOKGuhH4i60mw3dmRo4dLFvy9xj8Uk5950nypx6wEEgcME04?=
 =?us-ascii?Q?CS3zwNnI8NU6qGz0+5nZs98ii2PUtxkOAbAI5yqCcvdyJT6r8ZpwU72WpH3s?=
 =?us-ascii?Q?J0hjV4+8z55AcQ5x4XqcncO1nA68qDaobDOFLeCwk7GBkWn9LHj61suetj5w?=
 =?us-ascii?Q?m2wuXPbqT2fFdaxS39ldYOTKsmeoMei8SymVPxcjNjvFIiyqc9v+dC+ik2ZP?=
 =?us-ascii?Q?yWK2Dv4bgmPQrk7+SUXCQGDmr4Fz7T9eNi9D7AEJUf0oJvog4sT3d8Ok9KD9?=
 =?us-ascii?Q?IzTJ6DeIdxrUZXJDgcHdyFL/RzjBwLTvdcCerxw1JWQTfpHc+uPMtThSaDq1?=
 =?us-ascii?Q?X9DGAUVSH46bUOPoaeQAJGgQfpA83F9fPBs4L32MS0AteZVOB46rN02CXMTW?=
 =?us-ascii?Q?/M0ARdpHLBW0CVGiZkkNKER4LD+bMjfxkeGFCScG/2WksyRCF0q2E3oYgdT/?=
 =?us-ascii?Q?+UM4WHN4MxyMCjMqnJvOCGEP6Z8dM+4zYEldJEFzj/Tm7QpbjdajI5CmyZXV?=
 =?us-ascii?Q?9lYbRzEcxfUKeIQA1OQtetdrl21ipsoNb4Ywfbv/6uAnJT23SLq1kiK5tuGk?=
 =?us-ascii?Q?UKlDuWdVdXn273aj1VNHGEos0ll5sNXsgYHvbofg1QNbsmXKg3gwU67B/2Y2?=
 =?us-ascii?Q?R2jcoVFJOsGif81O2INcMmvMLTCceMn9uZpUreMsjNVTPm8NEQtwQbYdoTx6?=
 =?us-ascii?Q?XzO4d36ombqmFgNDdfqYK8X9gmIMTaiopFcvfyP0lmU6G4u/lLhEM+O2KB7Z?=
 =?us-ascii?Q?JzHfQ4de9Vx1jyNbrze3yZT8+t0dNVdkvp4hw7gVukr7BlTdHLHjrV3ZCh2y?=
 =?us-ascii?Q?LB6INzaVtwFIulJ0graPpx/aSDj8h/ng74JJ5RaT11IulDDi6yK4OqSNsp3L?=
 =?us-ascii?Q?lxiqod1TfcWL5PlwbaQZ42j1Ml1RkhYm2smGZslCiCVEtHBYy9AbRya9twKR?=
 =?us-ascii?Q?5NQSL/JWn1I2c3XF3MeoKLPVxtilQbUB7zvoUO3AVPl5nYnkDsxl3mlR2/6v?=
 =?us-ascii?Q?4EKgpmUJ1kIOZ/YS8/PVCv5MmA6W+4m68Hj7Pn2FFnptQGFUcgY42oWOAgLf?=
 =?us-ascii?Q?8spQD/L18VtveUAmPb8uzjhbKfNIUZIonDUSUFSk3kx1ocomYfmLp/WkyKEa?=
 =?us-ascii?Q?LjBz6jBQaubn+mg7zO+GYMlON3QMOYPLES1j/hXFCgpjdZ9RJlwfbOYv+x+n?=
 =?us-ascii?Q?SaClJLV4Di+E2w7BD7uP1I8VgskpTsd9aBVZ2np4T55nEJvD9Kf5zE/BQDGG?=
 =?us-ascii?Q?t7sorT/lDcbnQok0j5VFJe1yameQG6Q8He3Q8EMmxgaAbL8wgc4eIJbMJdFg?=
 =?us-ascii?Q?NqQ1YtvNig=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c53e8b-0472-456f-fc54-08de83e6b728
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 05:33:27.4244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBUzXYv79IhiNmV9gKr5OvccdP33o5N4fBggQld4mmft0ZNFizek3Kr9Mf/IyRBSSDAD37/8mS9W78IxOLghuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11779
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Simon Glass <sjg@chromium.org>,
 Peng Fan <peng.fan@nxp.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH] scmi: Rework SCMI_FIRMWARE implementation
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
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:iwamatsu@nigauri.org,m:sjg@chromium.org,m:peng.fan@nxp.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:michal.simek@amd.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.149];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 57C002A3FDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 07:24:14PM -0600, Tom Rini wrote:
>As exposed by "make randconfig", how we have SCMI_FIRMWARE today is
>incomplete, and in one case, used incorrectly. First, SCMI_FIRMWARE has
>a build-time dependency on OF_CONTROL being enabled, so add that.
>Second, RESET_SCMI depends on SCMI_FIRMWARE being enabled, it should not
>select that symbol. In turn, a number of platforms need to now enable
>SCMI_FIRMWARE explicitly and not rely on RESET_SCMI to enable it for
>them.
>
>Signed-off-by: Tom Rini <trini@konsulko.com>

Acked-by: Peng Fan <peng.fan@nxp.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
