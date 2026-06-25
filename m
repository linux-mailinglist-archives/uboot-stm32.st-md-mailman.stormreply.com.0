Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RUufH9rlPGoquAgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 10:24:58 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5F86C3BFB
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 10:24:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=cherry.de header.s=selector1 header.b=lTTm09MM;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=cherry.de (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8775C5A4C0;
	Thu, 25 Jun 2026 08:24:57 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93274C58D77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 08:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACua0Ay+ymuRFgxmT5g0gJhXhejXQfJdTQ1rcb446XKoDvTONwPy5JRfjvX04thwXxyfDro4NzhUhPVJwfB8o9LCeYN4ywZmjz7Bzj5qNtBH68I8TdjaxqhEkv8/wIon7P0TCCVMHjbdHF97ZjHHY2Sbg9RL48MN3iQK75mKWGw5EloI92H8OQ+vYScX7KccV1ePLz9Qqcim0F4jfj4kJg899mZ+yskQCZ/6glNldJpWz3gVTzF0sTvlv+5QsgEfgXIzaJfdv3d5eEnTxgw2dOALARL+rGOo7yy37LVtO+f16gWPlc6Vhcyq8kZ2QQlwgZpVyGfX9vHDR5mnhVTB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbJOoSOKUJjuW3NlXGNxibcXWOpJbfk0rwFneZ/uz74=;
 b=mZOLmqAr+vespijgQWL8B5Y5Ji7vae0bFigZTpFEnde1e3NXP8UwRfuFBbu5VgBtZEsPVZvgtulF/REBL6zy/DM7EqDcikrcT/ER2JoGt+Z5B51s/pFOAwenOR/qzAwmWZTEVUSJwNKVJL4k3NGWA06K8e5a9iBvsIutvF/ePrWm8Za5Rc5RF9lKi+rWLqT4DnfcWYdSUZTG9LZpSDWIbr9sbCZPSR2Rbe4uU/tUi2yIRdFZ2V19KVsCHHAAzXVYNlitkz76tQAaz8iTcQWPX3mg+dzJWsBqg4W9uKMUqxc36LmAD2kwj6Fw8DViAHpuBN8ThYpBsIUCC64DyMEEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbJOoSOKUJjuW3NlXGNxibcXWOpJbfk0rwFneZ/uz74=;
 b=lTTm09MMHxwB86b3Ij4GAmWhJ03nkVdZBsqTxznRzloV93pUCNtMH3FuK0umqUFoWyRx87VxJ2a9Wjv0xUIeMr97FnunaEEyNKWW9BDMWukqwII7l5y82OLImYBSla9gYpgRaPtaEPTGxCPSLTgScletlXmHu19uDZBM2Yw/U3A=
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM9PR04MB8337.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 08:24:52 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 08:24:52 +0000
Message-ID: <9ee2050e-5751-4d82-a8a8-e0c52f56e1f7@cherry.de>
Date: Thu, 25 Jun 2026 10:24:48 +0200
User-Agent: Mozilla Thunderbird
To: Anshul Dalal <anshuld@ti.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@lists.denx.de
References: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
X-ClientProxiedBy: VI1P194CA0044.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::33) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM9PR04MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: 546f7384-f53d-4b4f-bbb9-08ded2933ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|7416014|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: e3U+TikLNZ2/UTnfT3fnVAs7g4WDG/mOsIqaifYQSZLVYVGGYUgAC5N7mPwqWX/HJbdyQ8QXTzJd8Tkt5Ip3bMWAsB2l1UgWvCCRkTqUe7GMQbxg626qByGAl+18ED+9fF6gRkA9XyCO0LmUBMief+7XXd7/HXYrK91DsXwvf1qZimNr90y5bf2LtECwzFaGK2sXV9TyqvahnQshOvCY2LvY667SThYurZVPlDh/q8uCjKquQUQNQqDjK7kxe4qKtyaH3rMw0g9MghA6sMvYfWKKFTp97oPIRvdak4mLTsMvvc84/UBEpdl0U6MUQKOIa309fFhozDrD8FDeQA5oYWxMwEVnWmog46kFX8B27auJXuM19M+aCArfP6iDUz81BLFEzidvbKWAL6XBxlqGmgV7gSmk3ssGdfkQVqJTqDOCgU4V5TjhDOYqrmV+VQPisCqh4lYKg9mIoGG0f4Ef5a0SVXsPZ5JtfciD7+PXEYcaeLRRMDk4WUU22Hs9ZqwhkH024bkyTTiWTP53szKXzcjwLNHExS0EuiveEuV9UiT5FDgATc0NVHggaaaWnJpQqrwQfDZo4arq2XwynEVzohMFsF25dEYC7Q93wyF2GOlylsVo4UqVEz5wC6CcKvSTSaQwodJsM8rGBCvh8dGlooWMzlH8Vez/wgHpSMld4lE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3gvQXVtRzMyMXBCc3g1b1JEd3ZpOHhFNDdoQzFlejRYR2dQU29ZUVp5UXUr?=
 =?utf-8?B?dFBSSmRva3RlSGxkVlBYdFpJekVXc0xYZ3I2NWxnMFpzby81dFpKOGp6cWQx?=
 =?utf-8?B?SkVTSTlHTjRNYUQ2eElzTWFQM1pQVU9nQzFPYlhPS3FwRFh3MFJOd0NQQUNO?=
 =?utf-8?B?eE5TNmV0M0djZEYxaTBVQUd2L09XWm5sNnYvMDlwS0djWXlwU2FCYWRIaTZK?=
 =?utf-8?B?bnh3RWc5ajB0SFl3OEtHYXhLY3V2UU5MOTlpQWZONnBkbkVtY3A4VFVBVnRm?=
 =?utf-8?B?azFaK1p4SzlwUTF3QXRDYzNxUTFkTnpjS2hCN2FQNm5lTzJZRDJwOHhMcW9k?=
 =?utf-8?B?bFVTQThmWHA3dFE3OEZJMCtGZDhxaTdjRGhCbzRkL2orR1VJWDJpU3AyR2xx?=
 =?utf-8?B?R3dZSkcxdlU2R2h5SmFKaXhUM21BUmtNcGc5dGFNWURKZ2lPeFJNYlliWitH?=
 =?utf-8?B?aVI4WW1iT0g4QXhQSDBvVVRoREl1elBWalFCYnN3NHdMOHQ1b3A1OVZRSkxY?=
 =?utf-8?B?SGkxcGxyanA0QTBuQ3RnbHRrTUMvS2lsb1BMQWpLNGtSOFE4Z2JPeUFxd2pN?=
 =?utf-8?B?VWFVdXJzNDZYTjFWMHRyb3RiQktXREQraXBZa3hMdjVBNWdHaFE5bkN3Skxv?=
 =?utf-8?B?WWFqekNsZ05SSmZhWXZFY2Z6NUdUWUFjV3Vuanl4NW9UNUkwcksrZHNNcnBW?=
 =?utf-8?B?OGdwbG5RQU00UmtzU0NTZzY5alRuN3M1REFqMkNzaENhV0ZJZ1d1V0JINzJS?=
 =?utf-8?B?Q3pjYUFVN2xSWHIwZ0JDMnZNNzUxWjRVbHlxM0d5dzdpNDFvZ2p0ekNIOFRy?=
 =?utf-8?B?bVM0WldHUWFuWEp2bzJDR1JEUUhzQXZKbkdsNlhEcmdnYTFpOUxYWjNTVURa?=
 =?utf-8?B?L3BhNDJlL2pYbVo0OFVGcmxmY1ZDUy9hWTJBcm9vc1hsUXpmeStkZ0NuVXhX?=
 =?utf-8?B?QVBDdTBpR0tqNng4UEhoSGE4YnJsLzZ2bnRGM2NGUWE2R1ZTNlRNVzczc1hI?=
 =?utf-8?B?eUEzdFFDYUs0eE1ZWEVQWVNLRWRXOEx3OEc1NzlmQ3dwZkNVUHFmY1diOS9I?=
 =?utf-8?B?Y0NtakZ1Y1E5T2phbDhidHhScjhQSVcwZGFVRlZyd1c3bHVHWFFrbkpVRmhG?=
 =?utf-8?B?OUpHdXBhdjExZFNGWDNTdndqWG1PcFNuTVFYTTh1ZTBRU2cxR21VSlRUbk5X?=
 =?utf-8?B?dG0yRy9JaG9xWlJVR1RsekhGdC9pS2dDM1MwTmRFMklaTzMvTVRhZVAzNXRy?=
 =?utf-8?B?cXVaaThzT1dIeGd5alJpeklUVVVCemhWbytGVnlhWndEYmVUK1VXZmZlZW9H?=
 =?utf-8?B?ZzZ3cHU0MEdxNzFtNExnQ3JRVTc4dDdBM29hQVBmblFFaUIvcW1PS0FicU43?=
 =?utf-8?B?NS84blFEMWhFMkhHK0x1elNzZHdwRUsxVmJRVUxabTJLdXdvWEVpci9YU2FF?=
 =?utf-8?B?TjVuSHpmMURiSTJzUHQrWHgxRVlMREpXT1hoVmsyUnd3NVVIZk5TTGJFYlYy?=
 =?utf-8?B?Wmt2NGJ6TFYzcVNtWjdyTUJZOUVyaWtCRnBOcS9rU1drTkg4aEFwNDJQSStu?=
 =?utf-8?B?c1B5UDNoWEdrcHlyaU1ib3VDaWVkNEc1dGgrUk5FbWltV2ZxS2NRbi9sNHY3?=
 =?utf-8?B?RzdsVzB0VUtaMEwxRmcrQWttcithNG9FRzUwVHN3Tm85QzZCZzJyNFl0RitN?=
 =?utf-8?B?YXZrZEdjZGdzUmVKeXZQb2FrYVNnVjZOOUdCUklGMytpZkxWbmNiT05VUjI5?=
 =?utf-8?B?cUtsVnVJbjZwMFBDS29mdXNCYklPTytSendLS2hlditKSXNGNitGdWNrUzFW?=
 =?utf-8?B?S3NlbzNCb241RTk1bzZ4bCtVYlJDQlFYRWVuUWJWTmdsUDBRS2xwdUlPWFFR?=
 =?utf-8?B?a1M2TWluYnVnQTlucWEycEh0aDBNQnlTWVZpbGU0N3RTa1dJYzhwWHllZWEv?=
 =?utf-8?B?djN0clRpWkYzaXdNREpEaStlR3JBb3JLdTByZGZYb2JhSWsvWDdYQkNVdkEv?=
 =?utf-8?B?dUY3RE1XQ2svRXhqcEVDVERDZ1MxdlBUTmdpbG1qU0FFTXExZ1Rhci9XTE5L?=
 =?utf-8?B?cGlVb3V5WWc4ZjBkbG0yTWNJNDVZWFBtV0xhS0pacnBvbWNRSDcvMEhhS25a?=
 =?utf-8?B?YXdHZEJjN1hhWGVQck13MnVXMmZkZEFIU3JoZ2M4aHV6N0lXZHkzay9wSXJj?=
 =?utf-8?B?bmcrN2tIRmxYR0VIbjFlWW4rbm5qQ1V4OTZxc2ZMcS9pMVVTL240d3NoTFpR?=
 =?utf-8?B?WUFBQ3BFSUQ2TXY0RS94SEdTTCtHeklNQkl3LzcvK3IvSkVNZmNLV08wdy9s?=
 =?utf-8?B?Vzd6MEQ0WWVWTzZVaE9HT0RFUkpaNTVrQU5PdGs0L0VoSHVtK1lFUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 546f7384-f53d-4b4f-bbb9-08ded2933ad1
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 08:24:52.3676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbVSuCZ0LS1S6JnDWcjI1GG8LhToNuAmarHK6q1mP4lfhkOxsipLa17JNMXkOChdz6rCaobIAELqCYQmoHLeQiU6otaZV3SlwunbbaHZT7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8337
Cc: Peng Fan <peng.fan@nxp.com>, Yegor Yefremov <yegorslists@googlemail.com>,
 Tuyen Dang <tuyen.dang.xa@renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Jimmy Ho <jimmy.ho@sifive.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Alice Guo <alice.guo@nxp.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 Nick Hu <nick.hu@sifive.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Mateus Lima Alves <mateuslima.ti@gmail.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Beiyan Yun <root@infi.wang>, Jonathan Stroud <jonathan.stroud@amd.com>,
 Justin Swartz <justin.swartz@risingedge.co.za>,
 Bhupesh Sharma <bhupesh.linux@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh <dinesh.maniyam@altera.com>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Neha Malcom Francis <n-francis@ti.com>,
 Angelo Dureghello <angelo@kernel-space.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Padmarao Begari <padmarao.begari@amd.com>, Alexey Charkov <alchark@gmail.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] treewide: Kconfig: use bool instead of
	tristate
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[cherry.de : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[cherry.de:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:peng.fan@nxp.com,m:yegorslists@googlemail.com,m:tuyen.dang.xa@renesas.com,m:casey.connolly@linaro.org,m:shawn.lin@rock-chips.com,m:sebastian.reichel@collabora.com,m:daniel@thingy.jp,m:s-vadapalli@ti.com,m:jimmy.ho@sifive.com,m:lucienzx159@gmail.com,m:marex@denx.de,m:trini@konsulko.com,m:peter@korsgaard.com,m:jerome.forissier@arm.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:alice.guo@nxp.com,m:weijie.gao@mediatek.com,m:lukma@denx.de,m:nick.hu@sifive.com,m:jh80.chung@samsung.com,m:igor.belwon@mentallysanemainliners.org,m:pbrobinson@gmail.com,m:bastien.curutchet@bootlin.com,m:mateuslima.ti@gmail.com,m:jamie.gibbons@microchip.com,m:michael@amarulasolutions.com,m:tien.fong.chee@altera.com,m:kory.maincent@bootlin.com,m:mikhail.kshevetskiy@iopsys.eu,m:root@infi.wang,m:jonathan.stroud@amd.com,m:justin.swartz@risingedge.co.za,m:bhupesh.linux@gmail.com,m:michal.simek@amd.com
 ,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:hs@nabladev.com,m:neil.armstrong@linaro.org,m:ycliang@andestech.com,m:ralph.siemsen@linaro.org,m:n-francis@ti.com,m:angelo@kernel-space.org,m:sjg@chromium.org,m:ilias.apalodimas@linaro.org,m:padmarao.begari@amd.com,m:alchark@gmail.com,m:boon.khai.ng@altera.com,m:patrick.delaunay@foss.st.com,m:yegorslists@gmail.com,m:mateuslimati@gmail.com,m:bhupeshlinux@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[quentin.schulz@cherry.de,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cherry.de:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[52];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quentin.schulz@cherry.de,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,googlemail.com,renesas.com,linaro.org,rock-chips.com,collabora.com,thingy.jp,ti.com,sifive.com,gmail.com,denx.de,konsulko.com,korsgaard.com,arm.com,bootlin.com,gmx.de,mediatek.com,samsung.com,mentallysanemainliners.org,microchip.com,amarulasolutions.com,altera.com,iopsys.eu,infi.wang,amd.com,risingedge.co.za,nabladev.com,andestech.com,kernel-space.org,chromium.org,foss.st.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E5F86C3BFB

Hi Anshul,

Thanks for the cleanup!

On 6/25/26 5:17 AM, Anshul Dalal wrote:
> U-Boot does not support modules, so having tristate options is useless.
> 
> Therefore this patch does a blind replace of all tristate options to
> bool tree-wide.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
