Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GzmGxXP8WlrkgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 11:27:49 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE4491E52
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 11:27:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6ECAC87EDB;
	Wed, 29 Apr 2026 09:27:47 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50F4FC58D7A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 09:27:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dejiaXoD+XWFcDE34E9pAh9fmIKKgmz/GDaPMCcbgMTSX6vWCTgwCJO1ZWrFOXV7LyLEln9oZJDJzuik85JVX4zvr3uGwN+o9z0kIt61sshiLDJof/DrzeoFZV+WlOFkLPgSZ6/cRDukppL7pTXwNWzJXuQZdCeMz0x5Bg5S/EMqapg0r0slvqA6k/GH0f19iGO6ifsbdWVGklmheCkLT1QNGMM0SUis/otymMj3DklgCANmzXqz5kBIG0zOYSTTofmTswWniRZ3vYU4iCcmwQqxt99C4KN26aiZdvJhOvEzwtUnNjHcKEuhXowD2PHrAqd8UMf6t+d+AFKJD8BOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNUTvYkdz2vYiBGaRzaKFXBZTZGo+AKgQ9cIqkIGMTw=;
 b=naB9lZcLU0UhM7zOaGkDWcCniFNmZ6aSC3a7QqNp7HcngNXcdNC8lk3pzBSEd+qj2hfXm/bJxtkF1fDvYWSPyTQAFJ5oT42gCg3YFzQf+bRdmxdFHBpWwWKt9h0HP8iBwkrZYNdNZ9zhL36QcQ4RCA0BesjdW/RbV2fBDFdeh/dB0dcODQdJWZgRCuSD/kkBLOIOsag52YdcqSzo+djMySbUx5UUJNbN2jL+jKOHURP9U/EQOfRwczF5t8Mx2DKcZSRt6/2xXP4RPPs6DKaou8vj1OkfXB+cxYX3R9iQDNfaGqdqbASTgmHp0BWIF21W6UlF/rJSX0KS+8ia8FIXsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNUTvYkdz2vYiBGaRzaKFXBZTZGo+AKgQ9cIqkIGMTw=;
 b=S9lilJKlCMb4XvtuTKPrwcdOiiiwi2nUczti9ZRAIOawRjP7+EKj3XXmFowFuWMSOGtOHzCwy8KrzQvez03ROeROGXNBwGbZe3s5oVVNgnyc/vSXzQRADGdJK7eqCSgNHMrDrZFlypKet9EGm4ZGeQGV8Y1WZHKaj9ykWMw36httmMb5jLYac6H8eG4ga0z67c7Q+mqFGM5S9P7GTfshgnOBcKGzCzIesVu73sy+Nls+YPZbAGLvUs7Y9/HYIBXzjPxcV44B19XO9pMsUuRrBrENyGQQ2ryCxwJjwpOIlgFkuNlMS0+1utxbFalIQLlJP953jnFbIy10p9y+zE7kLQ==
Received: from AS4P189CA0063.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::13)
 by DU0PR10MB7589.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:402::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 09:27:34 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::93) by AS4P189CA0063.outlook.office365.com
 (2603:10a6:20b:659::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.29 via Frontend Transport; Wed,
 29 Apr 2026 09:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 09:27:34 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 29 Apr
 2026 11:31:06 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 29 Apr
 2026 11:27:32 +0200
Content-Type: multipart/mixed; boundary="------------TPMb7oNy1YR2UORoy5WUSvX3"
Message-ID: <c933b90b-9625-401a-b25c-6e06f7814e9e@foss.st.com>
Date: Wed, 29 Apr 2026 11:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20260426154724.2042569-1-dario.binacchi@amarulasolutions.com>
 <825d39e8-286d-4f83-a23e-0b798b1c9631@foss.st.com>
 <CABGWkvoJPMzHsh-_bZaVCMt3va5TpaWwK2e=yS7Nw0pcTrde+w@mail.gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CABGWkvoJPMzHsh-_bZaVCMt3va5TpaWwK2e=yS7Nw0pcTrde+w@mail.gmail.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B4:EE_|DU0PR10MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a57075-9c2d-4dd9-254a-08dea5d18bc2
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|6049299003|36860700016|1800799024|376014|7416014|82310400026|56012099003|22082099003|18002099003|4053099003|13003099007;
X-Microsoft-Antispam-Message-Info: dYbMM6uesNwUFs4xU7H82SR+ep+sKWP2J8pKXSfKFuKbsFKPgbpm4lXBgM1LhGJhAFon+suFKY+7Vdf2oT4FhHkhAzyBhMmER4Fd67mhOF2nMdEoheLaaOSj5Tsi1LdvRSr1bcOEZaS1RcIvRLTbIlpKqAULBi/syN1bPyfOtdmHaZDsy/KduW3lCN7MFFjOCmOJavjUuVNK2JEXEYk9xuZsNXg0qlHtHn/Q2HS6kWj6cuewcvBzhi1AKyoc7clk5D6vrFuZ0AniNpViGsGlKlNvxbW+4Mt0UGEoibLblQB60/wSvCsCJ/qP62B755H1nE2T+2JGMx2vPdtLWKhLXIyuTiHnETRmNanQtmnJTdK172NMFT7FjkXxWi9EwDhHaTf+X4Hgk3sZSorkFg0p/ShWVg8aj+wLKiVTcrwZQORovt4LGJpPC5BxicIrL0lDDLN19qpJwPM4zjmQOp/aWFuMyDvsgBMZPjPQ6t9UDOla+8cZN2aLLOcdus1nL9t5Cj5I9TvCk9i8K8dbV7X/p0PWtaRk1PHtVNpEGXrCHCgUk473wXa4CxcZrhTUrD1LiJAAVtGGY3NtPRHtg59M+mKyZhlaE9VQWCXJgiXORxfjdBAZcOeeZmVt5sFAG2uGR7pLGKGP43pe/eQiinT7rzpkH5TV6h32m0M9dSh3e9u0vKK9nm+H09SLdmf9fNLDJWLdgG3X/BpW85+o/cVt1BApQlfkpqaAzaecxJAaVek=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(6049299003)(36860700016)(1800799024)(376014)(7416014)(82310400026)(56012099003)(22082099003)(18002099003)(4053099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ifam9ASnYTLkCaJqApFrU74Rn4PBmam29QEWP71qts2EQM5FrS1+ggxSTkk4Lx52+y0NiDeYB3/of0MyjtY9ArXni/IUcrRb6jVfNMdX3u7lzXsS2Sweqxe/NLHpLAprxMZKX79zqDfRkqermHAV49tF1lqThxoxzFJAhM0lnMQgismGE8corBc45uX+ab1r0mR0It2mEiw1PwWpveEivXvWwRcpLnhSwYjRx/3rS4Jmn22+9QDcU9b+xjqyR7DvcvxhOwj7CZs7aQ/9oKSIl5KQ89g7B/nqUyBBRUuFi3zygdOwtx5Lf+kPohYBFyNckU0zu+4lHOBWFhEbNXu25yPG4LWec2OT85jT4lRkPgx5SKU3j87F3mFwVA5oICh5JL43BAKlUCSg5PGm1VuFKitIEw1QF+2YxQwTXZUKayfOyhFD/Y7+eTQ+JN6VZ7qy
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:27:34.3650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a57075-9c2d-4dd9-254a-08dea5d18bc2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7589
Cc: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@arm.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Rasmus Villemoes <ravi@prevas.dk>, Jonathan GUILLOT <jonathan@joggee.fr>,
 Michal Simek <michal.simek@amd.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Padmarao
 Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 linux-amarula@amarulasolutions.com, Sughosh Ganu <sughosh.ganu@arm.com>
Subject: Re: [Uboot-stm32] [PATCH v7 0/8] Support metadata-driven A/B boot
	for STM32MP25
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
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: C6EE4491E52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[text/x-log];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:vincent.stehle@arm.com,m:mkorpershoek@kernel.org,m:quentin.schulz@cherry.de,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:jerome.forissier@arm.com,m:xypron.glpk@gmx.de,m:javierm@redhat.com,m:marek.vasut+renesas@mailbox.org,m:ravi@prevas.dk,m:jonathan@joggee.fr,m:michal.simek@amd.com,m:dinesh.maniyam@altera.com,m:kory.maincent@bootlin.com,m:sjg@chromium.org,m:ilias.apalodimas@linaro.org,m:padmarao.begari@amd.com,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:linux-amarula@amarulasolutions.com,m:sughosh.ganu@arm.com,m:marek.vasut@mailbox.org,m:bmengcn@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,cherry.de,lists.denx.de,st-md-mailman.stormreply.com,konsulko.com,gmx.de,redhat.com,mailbox.org,prevas.dk,joggee.fr,amd.com,altera.com,bootlin.com,chromium.org,linaro.org,foss.st.com,gmail.com,amarulasolutions.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_SPAM(0.00)[0.797];
	RCVD_COUNT_SEVEN(0.00)[7]

--------------TPMb7oNy1YR2UORoy5WUSvX3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Dario

Please find the log of test.py execution for qemu-riscv32 test which triggers the error mentioned.

For information, 9 qemu tests are failed with the same error.

qemu-riscv32 test.py
qemu-riscv32_spl test.py
qemu-riscv64 test.py
qemu-riscv64_smode test.py
qemu-riscv64_smode_acpi test.py
qemu-riscv64_spl test.py
qemu-x86_64 test.py
qemu_arm64 test.py
qemu_arm test.py

Thanks
Patrice


On 4/29/26 11:19, Dario Binacchi wrote:
> Hello Patrice,
> 
> Sorry, but I can't log in. My Custodian account has expired, and that might
> be the reason. I need to ask Tom Rini to reactivate it.
> In the meantime, can you please give me some information about the error?
> 
> Thanks and regards,
> Dario
> 
> On Wed, Apr 29, 2026 at 11:14 AM Patrice CHOTARD <
> patrice.chotard@foss.st.com> wrote:
> 
>>
>>
>> On 4/26/26 17:46, Dario Binacchi wrote:
>>> This series, the mainline version of [1], provides the necessary changes
>>> in U-Boot to support the metadata-driven A/B update flow for STM32MP25
>>> boards. It implements the logic required to dynamically select the boot
>>> bank based on FWU metadata.
>>>
>>> These changes are designed to be backward compatible while providing
>>> the necessary infrastructure for the A/B scheme.
>>>
>>> The series has been tested on the STM32MP257F-EV1 board.
>>>
>>> Additionally, some patches in the series propose changes with
>>> general-purpose utility:
>>>
>>>  1/7 lib: uuid: add partition type GUID for extended bootloader
>>>  4/7 cmd: part: support lookup by UUID in 'part number'
>>>  6/7 fwu: add helper to get image GUID by type and bank index
>>>
>>> [1] https://github.com/STMicroelectronics/u-boot/pull/6
>>>
>>> Changes in v7:
>>> - Add Reviewed-by of Simon Glass for patc 7/8 of "test: dm:
>>>   fwu_mdata: add test for fwu_mdata_get_image_guid".
>>>
>>> Changes in v6:
>>> - Add Reviewed-by of Simon Glass to patch 3/8 "test: cmd: add unit
>>>   tests for part command"
>>>
>>> Changes in v5:
>>> - Update doc/usage/cmd/part.rst to reflect the changes related to the
>>>   part command.
>>> - Add Acked-by of Ilias Apalodimas to patch 6/8 "fwu: add helper to get
>>>   image GUID by type and bank index"
>>>
>>> Changes in v4:
>>> - Place the part command tests in the cmd suite rather than the dm
>>>   suite.
>>> - Order the include files according the U-Boot coding style.
>>> - Add patch 7/8 test: dm: fwu_mdata: add test for
>> fwu_mdata_get_image_guid
>>>
>>> Changes in v3:
>>> - Wrap lines exceeding 80 columns in test/cmd/part.c file.
>>> - Combine run_command() and ut_asserteq() -> ut_asserteq(1, run_command(
>>> - Add kerneldoc comment for fwu_mdata_get_image_guid() above its
>> declaration
>>>   in fwu.h.
>>> - Add log_warning() messages to fwu_platform_hook() to catch inconsistent
>>>   FWU metadata (boot GUID found but root GUID missing or viceversa), as
>>>   suggested by Simon Glass.
>>>
>>> Changes in v2:
>>> - Add links to the XBOOTLDR specification in the commit message of patch
>>>    1/7 lib: uuid: add partition type GUID for extended bootloader.
>>> - Update help for 'part start', 'part size' to mention UUID.
>>> - Add kerneldoc comment for fwu_mdata_get_image_guid().
>>> - Pass efi_guid_t by pointer in fwu_mdata_get_image_guid().
>>> - Add patches:
>>>    5/7 test: cmd: part: add UUID lookup tests
>>>    3/7 test: cmd: add unit tests for part command
>>>    2/7 test: dm: part: add test for part_get_info_by_uuid
>>>
>>> Dario Binacchi (8):
>>>   lib: uuid: add partition type GUID for extended bootloader
>>>   test: dm: part: add test for part_get_info_by_uuid
>>>   test: cmd: add unit tests for part command
>>>   cmd: part: support lookup by UUID
>>>   test: cmd: part: add UUID lookup tests
>>>   fwu: add helper to get image GUID by type and bank index
>>>   test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid
>>>   board: st: stm32mp25: support dynamic A/B bank bootup
>>>
>>>  board/st/stm32mp2/stm32mp2.c          |  32 ++++
>>>  cmd/part.c                            |  12 +-
>>>  doc/README.gpt                        |   2 +
>>>  doc/usage/cmd/part.rst                |   6 +-
>>>  include/configs/stm32mp25_st_common.h |  15 ++
>>>  include/fwu.h                         |  11 ++
>>>  include/part_efi.h                    |   3 +
>>>  lib/fwu_updates/fwu.c                 |  33 ++++
>>>  lib/uuid.c                            |   1 +
>>>  test/cmd/Makefile                     |   1 +
>>>  test/cmd/part.c                       | 209 ++++++++++++++++++++++++++
>>>  test/dm/fwu_mdata.c                   |  48 ++++++
>>>  test/dm/part.c                        |  53 +++++++
>>>  13 files changed, 419 insertions(+), 7 deletions(-)
>>>  create mode 100644 test/cmd/part.c
>>>
>>
>>
>>
>> Hi Dario
>>
>> I am preparing a pull request for STM32 including this series.
>> Unfortunately, there is an error linked to tests test/cmd/part.c
>>
>> You can use my temporary pull request tag u-boot-stm32-20260429
>>
>> You will find the error logs here encountered with qemu test :
>> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/29932
>>
>> Thanks
>> Patrice
>>
>>
> 

--------------TPMb7oNy1YR2UORoy5WUSvX3
Content-Type: text/x-log; charset="UTF-8"; name="qemu-riscv32_test.py.log"
Content-Disposition: attachment; filename="qemu-riscv32_test.py.log"
Content-Transfer-Encoding: base64

G1swS1J1bm5pbmcgd2l0aCBnaXRsYWItcnVubmVyIDE3LjguMSAoYTFmY2EwMGUpG1swO20K
G1swSyAgb24ga29uc3Vsa28tZ3VydSB0Ml81eW9jeUQsIHN5c3RlbSBJRDogc185OTE2NjA0
MGY2YzIbWzA7bQpzZWN0aW9uX3N0YXJ0OjE3Nzc0NTA4NjI6cHJlcGFyZV9leGVjdXRvcgob
WzBLG1swSxtbMzY7MW1QcmVwYXJpbmcgdGhlICJkb2NrZXIiIGV4ZWN1dG9yG1swO20bWzA7
bQobWzBLVXNpbmcgRG9ja2VyIGV4ZWN1dG9yIHdpdGggaW1hZ2UgZG9ja2VyLmlvL3RyaW5p
L3UtYm9vdC1naXRsYWItY2ktcnVubmVyOm5vYmxlLTIwMjUxMDEzLTIzSmFuMjAyNiAuLi4b
WzA7bQobWzBLUHVsbGluZyBkb2NrZXIgaW1hZ2UgZG9ja2VyLmlvL3RyaW5pL3UtYm9vdC1n
aXRsYWItY2ktcnVubmVyOm5vYmxlLTIwMjUxMDEzLTIzSmFuMjAyNiAuLi4bWzA7bQobWzBL
VXNpbmcgZG9ja2VyIGltYWdlIHNoYTI1NjplMTE4Yjk3ZjE5MDNiZDk2NzNkNWIzNmRmZmNk
ZDJiNGMyNDRhYTViOWJiNTk5M2ZkMzljMzQ0M2RjNzFlZDc4IGZvciBkb2NrZXIuaW8vdHJp
bmkvdS1ib290LWdpdGxhYi1jaS1ydW5uZXI6bm9ibGUtMjAyNTEwMTMtMjNKYW4yMDI2IHdp
dGggZGlnZXN0IHRyaW5pL3UtYm9vdC1naXRsYWItY2ktcnVubmVyQHNoYTI1NjoxYjQyNmRj
NDBlOTNlZWJiYzIxNGQ5N2I3M2YyNmJhMzk0ZjU2NTVjNDZiNmQxZWI0ZjE0NjUwYjFlZmVj
NGU4IC4uLhtbMDttCnNlY3Rpb25fZW5kOjE3Nzc0NTA4NjQ6cHJlcGFyZV9leGVjdXRvcgob
WzBLc2VjdGlvbl9zdGFydDoxNzc3NDUwODY0OnByZXBhcmVfc2NyaXB0ChtbMEsbWzBLG1sz
NjsxbVByZXBhcmluZyBlbnZpcm9ubWVudBtbMDttG1swO20KUnVubmluZyBvbiBydW5uZXIt
dDI1eW9jeWQtcHJvamVjdC01NDMtY29uY3VycmVudC0wIHZpYSBndXJ1Li4uCnNlY3Rpb25f
ZW5kOjE3Nzc0NTA4NjQ6cHJlcGFyZV9zY3JpcHQKG1swS3NlY3Rpb25fc3RhcnQ6MTc3NzQ1
MDg2NDpnZXRfc291cmNlcwobWzBLG1swSxtbMzY7MW1HZXR0aW5nIHNvdXJjZSBmcm9tIEdp
dCByZXBvc2l0b3J5G1swO20bWzA7bQobWzMyOzFtRmV0Y2hpbmcgY2hhbmdlcy4uLhtbMDtt
ClJlaW5pdGlhbGl6ZWQgZXhpc3RpbmcgR2l0IHJlcG9zaXRvcnkgaW4gL2J1aWxkcy91LWJv
b3QvY3VzdG9kaWFucy91LWJvb3Qtc3RtLy5naXQvChtbMzI7MW1DaGVja2luZyBvdXQgMzM5
NjFlZTEgYXMgZGV0YWNoZWQgSEVBRCAocmVmIGlzIHUtYm9vdC1zdG0zMi0yMDI2MDQyOSku
Li4bWzA7bQpSZW1vdmluZyB0ZXN0L3B5Ly5weXRlc3RfY2FjaGUvClJlbW92aW5nIHRlc3Qv
cHkvX19weWNhY2hlX18vClJlbW92aW5nIHRlc3QvcHkvdGVzdHMvX19weWNhY2hlX18vClJl
bW92aW5nIHRlc3QvcHkvdGVzdHMvdGVzdF9hbmRyb2lkL19fcHljYWNoZV9fLwpSZW1vdmlu
ZyB0ZXN0L3B5L3Rlc3RzL3Rlc3RfZWZpX2NhcHN1bGUvX19weWNhY2hlX18vClJlbW92aW5n
IHRlc3QvcHkvdGVzdHMvdGVzdF9lZmlfc2VjYm9vdC9fX3B5Y2FjaGVfXy8KUmVtb3Zpbmcg
dGVzdC9weS90ZXN0cy90ZXN0X2ZzL19fcHljYWNoZV9fLwpSZW1vdmluZyB0ZXN0L3B5L3Rl
c3RzL3Rlc3RfZnMvdGVzdF9zcXVhc2hmcy9fX3B5Y2FjaGVfXy8KUmVtb3ZpbmcgdGVzdC9w
eS90ZXN0cy90ZXN0X3NlbWlob3N0aW5nL19fcHljYWNoZV9fLwpSZW1vdmluZyB0b29scy9i
dWlsZG1hbi9fX3B5Y2FjaGVfXy8KUmVtb3ZpbmcgdG9vbHMvcGF0bWFuL19fcHljYWNoZV9f
LwpSZW1vdmluZyB0b29scy91X2Jvb3RfcHlsaWIvX19weWNhY2hlX18vCgobWzMyOzFtU2tp
cHBpbmcgR2l0IHN1Ym1vZHVsZXMgc2V0dXAbWzA7bQpzZWN0aW9uX2VuZDoxNzc3NDUwODY5
OmdldF9zb3VyY2VzChtbMEtzZWN0aW9uX3N0YXJ0OjE3Nzc0NTA4Njk6c3RlcF9zY3JpcHQK
G1swSxtbMEsbWzM2OzFtRXhlY3V0aW5nICJzdGVwX3NjcmlwdCIgc3RhZ2Ugb2YgdGhlIGpv
YiBzY3JpcHQbWzA7bRtbMDttChtbMEtVc2luZyBkb2NrZXIgaW1hZ2Ugc2hhMjU2OmUxMThi
OTdmMTkwM2JkOTY3M2Q1YjM2ZGZmY2RkMmI0YzI0NGFhNWI5YmI1OTkzZmQzOWMzNDQzZGM3
MWVkNzggZm9yIGRvY2tlci5pby90cmluaS91LWJvb3QtZ2l0bGFiLWNpLXJ1bm5lcjpub2Js
ZS0yMDI1MTAxMy0yM0phbjIwMjYgd2l0aCBkaWdlc3QgdHJpbmkvdS1ib290LWdpdGxhYi1j
aS1ydW5uZXJAc2hhMjU2OjFiNDI2ZGM0MGU5M2VlYmJjMjE0ZDk3YjczZjI2YmEzOTRmNTY1
NWM0NmI2ZDFlYjRmMTQ2NTBiMWVmZWM0ZTggLi4uG1swO20KG1szMjsxbSQgZ2l0IGNvbmZp
ZyAtLWdsb2JhbCAtLWFkZCBzYWZlLmRpcmVjdG9yeSAiJHtDSV9QUk9KRUNUX0RJUn0iG1sw
O20KG1szMjsxbSQgZ2l0IGNsb25lIC0tZGVwdGg9MSBodHRwczovL3NvdXJjZS5kZW54LmRl
L3UtYm9vdC91LWJvb3QtdGVzdC1ob29rcyAvdG1wL3Vib290LXRlc3QtaG9va3MbWzA7bQpD
bG9uaW5nIGludG8gJy90bXAvdWJvb3QtdGVzdC1ob29rcycuLi4Kd2FybmluZzogcmVkaXJl
Y3RpbmcgdG8gaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290LXRlc3QtaG9v
a3MuZ2l0LwobWzMyOzFtJCBsbiAtcyBjb25mLnFlbXVfYXJtNjQgL3RtcC91Ym9vdC10ZXN0
LWhvb2tzL2Jpbi90cmF2aXMtY2kvY29uZi5xZW11X2FybTY0X2x3aXBfbmEbWzA7bQobWzMy
OzFtJCBsbiAtcyB1X2Jvb3RfYm9hcmRlbnZfcWVtdV9hcm02NF9uYS5weSAvdG1wL3Vib290
LXRlc3QtaG9va3MvcHkvdHJhdmlzLWNpL3VfYm9vdF9ib2FyZGVudl9xZW11X2FybTY0X2x3
aXBfbmEucHkbWzA7bQobWzMyOzFtJCBsbiAtcyB0cmF2aXMtY2kgL3RtcC91Ym9vdC10ZXN0
LWhvb2tzL2Jpbi9gaG9zdG5hbWVgG1swO20KG1szMjsxbSQgbG4gLXMgdHJhdmlzLWNpIC90
bXAvdWJvb3QtdGVzdC1ob29rcy9weS9gaG9zdG5hbWVgG1swO20KG1szMjsxbSQgaWYgW1sg
IiR7VEVTVF9QWV9CRH0iID09ICJxZW11LXJpc2N2MzJfc3BsIiBdXSB8fCBbWyAiJHtURVNU
X1BZX0JEfSIgPT0gInhpbGlueF9tYnYzMl9zbW9kZSIgXV07IHRoZW4gd2dldCAtTyAtIGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3BlbnNiaS9yZWxlYXNlcy9k
b3dubG9hZC92MS4zLjEvb3BlbnNiaS0xLjMuMS1ydi1iaW4udGFyLnh6IHwgdGFyIC1DIC90
bXAgLXhKOyBleHBvcnQgT1BFTlNCST0vdG1wL29wZW5zYmktMS4zLjEtcnYtYmluL3NoYXJl
L29wZW5zYmkvaWxwMzIvZ2VuZXJpYy9maXJtd2FyZS9md19keW5hbWljLmJpbjsgZmkbWzA7
bQobWzMyOzFtJCBpZiBbWyAiJHtURVNUX1BZX0JEfSIgPT0gInFlbXUtcmlzY3Y2NF9zcGwi
IF1dIHx8IFtbICIke1RFU1RfUFlfQkR9IiA9PSAic2lmaXZlX3VubGVhc2hlZCIgXV0gfHwg
W1sgIiR7VEVTVF9QWV9CRH0iID09ICJ4aWxpbnhfbWJ2NjRfc21vZGUiIF1dOyB0aGVuIHdn
ZXQgLU8gLSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3JjL29wZW5zYmkv
cmVsZWFzZXMvZG93bmxvYWQvdjEuMy4xL29wZW5zYmktMS4zLjEtcnYtYmluLnRhci54eiB8
IHRhciAtQyAvdG1wIC14SjsgZXhwb3J0IE9QRU5TQkk9L3RtcC9vcGVuc2JpLTEuMy4xLXJ2
LWJpbi9zaGFyZS9vcGVuc2JpL2xwNjQvZ2VuZXJpYy9maXJtd2FyZS9md19keW5hbWljLmJp
bjsgZmkbWzA7bQobWzMyOzFtJCBpZiBbWyAiJHtURVNUX1BZX0JEfSIgPT0gInFlbXUtYXJt
LXNic2EiIF1dOyB0aGVuIHdnZXQgLU8gL3RtcC9ibDEuYmluIGh0dHBzOi8vYXJ0aWZhY3Rz
LmNvZGVsaW5hcm8ub3JnL2FydGlmYWN0b3J5L2xpbmFyby00MTktc2JzYS1yZWYvbGF0ZXN0
L3RmLWEvYmwxLmJpbjsgd2dldCAtTyAvdG1wL2ZpcC5iaW4gaHR0cHM6Ly9hcnRpZmFjdHMu
Y29kZWxpbmFyby5vcmcvYXJ0aWZhY3RvcnkvbGluYXJvLTQxOS1zYnNhLXJlZi9sYXRlc3Qv
dGYtYS9maXAuYmluOyBleHBvcnQgQklOTUFOX0lORElSUz0vdG1wOyBmaRtbMDttChtbMzI7
MW0kIHB5dGhvbjMgLW0gdmVudiAvdG1wL3ZlbnY7IC4gL3RtcC92ZW52L2Jpbi9hY3RpdmF0
ZTsgcGlwIGluc3RhbGwgLXIgdGVzdC9weS9yZXF1aXJlbWVudHMudHh0IC1yIHRvb2xzL2Jp
bm1hbi9yZXF1aXJlbWVudHMudHh0IC1yIHRvb2xzL2J1aWxkbWFuL3JlcXVpcmVtZW50cy50
eHQgLXIgdG9vbHMvdV9ib290X3B5bGliL3JlcXVpcmVtZW50cy50eHQgc2V0dXB0b29scxtb
MDttCkNvbGxlY3Rpbmcgc2V0dXB0b29scwogIERvd25sb2FkaW5nIHNldHVwdG9vbHMtODIu
MC4xLXB5My1ub25lLWFueS53aGwubWV0YWRhdGEgKDYuNSBrQikKQ29sbGVjdGluZyBmaWxl
bG9jaz09My4yMC4zIChmcm9tIC1yIHRlc3QvcHkvcmVxdWlyZW1lbnRzLnR4dCAobGluZSAx
KSkKICBVc2luZyBjYWNoZWQgZmlsZWxvY2stMy4yMC4zLXB5My1ub25lLWFueS53aGwubWV0
YWRhdGEgKDIuMSBrQikKQ29sbGVjdGluZyBweWNyeXB0b2RvbWV4PT0zLjIxLjAgKGZyb20g
LXIgdGVzdC9weS9yZXF1aXJlbWVudHMudHh0IChsaW5lIDIpKQogIFVzaW5nIGNhY2hlZCBw
eWNyeXB0b2RvbWV4LTMuMjEuMC1jcDM2LWFiaTMtbWFueWxpbnV4XzJfMTdfYWFyY2g2NC5t
YW55bGludXgyMDE0X2FhcmNoNjQud2hsLm1ldGFkYXRhICgzLjQga0IpCkNvbGxlY3Rpbmcg
cHl0ZXN0PT04LjQuMiAoZnJvbSAtciB0ZXN0L3B5L3JlcXVpcmVtZW50cy50eHQgKGxpbmUg
MykpCiAgVXNpbmcgY2FjaGVkIHB5dGVzdC04LjQuMi1weTMtbm9uZS1hbnkud2hsLm1ldGFk
YXRhICg3Ljcga0IpCkNvbGxlY3RpbmcgcHl0ZXN0LXhkaXN0PT0yLjUuMCAoZnJvbSAtciB0
ZXN0L3B5L3JlcXVpcmVtZW50cy50eHQgKGxpbmUgNCkpCiAgVXNpbmcgY2FjaGVkIHB5dGVz
dF94ZGlzdC0yLjUuMC1weTMtbm9uZS1hbnkud2hsLm1ldGFkYXRhICgyMSBrQikKQ29sbGVj
dGluZyBGQVR0b29scz09MS4wLjQyIChmcm9tIC1yIHRlc3QvcHkvcmVxdWlyZW1lbnRzLnR4
dCAobGluZSA1KSkKICBVc2luZyBjYWNoZWQgRkFUdG9vbHMtMS4wLjQyLXB5My1ub25lLWFu
eS53aGwubWV0YWRhdGEgKDguNiBrQikKQ29sbGVjdGluZyBjb3ZlcmFnZT09Ny44LjAgKGZy
b20gLXIgdG9vbHMvYmlubWFuL3JlcXVpcmVtZW50cy50eHQgKGxpbmUgMSkpCiAgVXNpbmcg
Y2FjaGVkIGNvdmVyYWdlLTcuOC4wLWNwMzEyLWNwMzEyLW1hbnlsaW51eF8yXzE3X2FhcmNo
NjQubWFueWxpbnV4MjAxNF9hYXJjaDY0LndobC5tZXRhZGF0YSAoOC41IGtCKQpDb2xsZWN0
aW5nIGltcG9ydGxpYl9yZXNvdXJjZXM9PTYuNS4yIChmcm9tIC1yIHRvb2xzL2Jpbm1hbi9y
ZXF1aXJlbWVudHMudHh0IChsaW5lIDIpKQogIFVzaW5nIGNhY2hlZCBpbXBvcnRsaWJfcmVz
b3VyY2VzLTYuNS4yLXB5My1ub25lLWFueS53aGwubWV0YWRhdGEgKDMuOSBrQikKQ29sbGVj
dGluZyBqc29uc2NoZW1hPT00LjIzLjAgKGZyb20gLXIgdG9vbHMvYmlubWFuL3JlcXVpcmVt
ZW50cy50eHQgKGxpbmUgMykpCiAgVXNpbmcgY2FjaGVkIGpzb25zY2hlbWEtNC4yMy4wLXB5
My1ub25lLWFueS53aGwubWV0YWRhdGEgKDcuOSBrQikKQ29sbGVjdGluZyBweWVsZnRvb2xz
PT0wLjMxIChmcm9tIC1yIHRvb2xzL2Jpbm1hbi9yZXF1aXJlbWVudHMudHh0IChsaW5lIDUp
KQogIFVzaW5nIGNhY2hlZCBweWVsZnRvb2xzLTAuMzEtcHkzLW5vbmUtYW55LndobC5tZXRh
ZGF0YSAoMzgxIGJ5dGVzKQpDb2xsZWN0aW5nIHlhbWxsaW50PT0xLjM1LjEgKGZyb20gLXIg
dG9vbHMvYmlubWFuL3JlcXVpcmVtZW50cy50eHQgKGxpbmUgNikpCiAgVXNpbmcgY2FjaGVk
IHlhbWxsaW50LTEuMzUuMS1weTMtbm9uZS1hbnkud2hsLm1ldGFkYXRhICg0LjIga0IpCkNv
bGxlY3RpbmcgY29uY3VycmVuY3l0ZXN0PT0wLjEuMiAoZnJvbSAtciB0b29scy91X2Jvb3Rf
cHlsaWIvcmVxdWlyZW1lbnRzLnR4dCAobGluZSAxKSkKICBVc2luZyBjYWNoZWQgY29uY3Vy
cmVuY3l0ZXN0LTAuMS4yLXB5My1ub25lLWFueS53aGwKQ29sbGVjdGluZyBpbmljb25maWc+
PTEgKGZyb20gcHl0ZXN0PT04LjQuMi0+LXIgdGVzdC9weS9yZXF1aXJlbWVudHMudHh0IChs
aW5lIDMpKQogIFVzaW5nIGNhY2hlZCBpbmljb25maWctMi4zLjAtcHkzLW5vbmUtYW55Lndo
bC5tZXRhZGF0YSAoMi41IGtCKQpDb2xsZWN0aW5nIHBhY2thZ2luZz49MjAgKGZyb20gcHl0
ZXN0PT04LjQuMi0+LXIgdGVzdC9weS9yZXF1aXJlbWVudHMudHh0IChsaW5lIDMpKQogIERv
d25sb2FkaW5nIHBhY2thZ2luZy0yNi4yLXB5My1ub25lLWFueS53aGwubWV0YWRhdGEgKDMu
NSBrQikKQ29sbGVjdGluZyBwbHVnZ3k8Miw+PTEuNSAoZnJvbSBweXRlc3Q9PTguNC4yLT4t
ciB0ZXN0L3B5L3JlcXVpcmVtZW50cy50eHQgKGxpbmUgMykpCiAgVXNpbmcgY2FjaGVkIHBs
dWdneS0xLjYuMC1weTMtbm9uZS1hbnkud2hsLm1ldGFkYXRhICg0Ljgga0IpCkNvbGxlY3Rp
bmcgcHlnbWVudHM+PTIuNy4yIChmcm9tIHB5dGVzdD09OC40LjItPi1yIHRlc3QvcHkvcmVx
dWlyZW1lbnRzLnR4dCAobGluZSAzKSkKICBEb3dubG9hZGluZyBweWdtZW50cy0yLjIwLjAt
cHkzLW5vbmUtYW55LndobC5tZXRhZGF0YSAoMi41IGtCKQpDb2xsZWN0aW5nIGV4ZWNuZXQ+
PTEuMSAoZnJvbSBweXRlc3QteGRpc3Q9PTIuNS4wLT4tciB0ZXN0L3B5L3JlcXVpcmVtZW50
cy50eHQgKGxpbmUgNCkpCiAgVXNpbmcgY2FjaGVkIGV4ZWNuZXQtMi4xLjItcHkzLW5vbmUt
YW55LndobC5tZXRhZGF0YSAoMi45IGtCKQpDb2xsZWN0aW5nIHB5dGVzdC1mb3JrZWQgKGZy
b20gcHl0ZXN0LXhkaXN0PT0yLjUuMC0+LXIgdGVzdC9weS9yZXF1aXJlbWVudHMudHh0IChs
aW5lIDQpKQogIFVzaW5nIGNhY2hlZCBweXRlc3RfZm9ya2VkLTEuNi4wLXB5My1ub25lLWFu
eS53aGwubWV0YWRhdGEgKDMuNSBrQikKQ29sbGVjdGluZyBoZXhkdW1wIChmcm9tIEZBVHRv
b2xzPT0xLjAuNDItPi1yIHRlc3QvcHkvcmVxdWlyZW1lbnRzLnR4dCAobGluZSA1KSkKICBV
c2luZyBjYWNoZWQgaGV4ZHVtcC0zLjMtcHkzLW5vbmUtYW55LndobApDb2xsZWN0aW5nIGF0
dHJzPj0yMi4yLjAgKGZyb20ganNvbnNjaGVtYT09NC4yMy4wLT4tciB0b29scy9iaW5tYW4v
cmVxdWlyZW1lbnRzLnR4dCAobGluZSAzKSkKICBEb3dubG9hZGluZyBhdHRycy0yNi4xLjAt
cHkzLW5vbmUtYW55LndobC5tZXRhZGF0YSAoOC44IGtCKQpDb2xsZWN0aW5nIGpzb25zY2hl
bWEtc3BlY2lmaWNhdGlvbnM+PTIwMjMuMDMuNiAoZnJvbSBqc29uc2NoZW1hPT00LjIzLjAt
Pi1yIHRvb2xzL2Jpbm1hbi9yZXF1aXJlbWVudHMudHh0IChsaW5lIDMpKQogIFVzaW5nIGNh
Y2hlZCBqc29uc2NoZW1hX3NwZWNpZmljYXRpb25zLTIwMjUuOS4xLXB5My1ub25lLWFueS53
aGwubWV0YWRhdGEgKDIuOSBrQikKQ29sbGVjdGluZyByZWZlcmVuY2luZz49MC4yOC40IChm
cm9tIGpzb25zY2hlbWE9PTQuMjMuMC0+LXIgdG9vbHMvYmlubWFuL3JlcXVpcmVtZW50cy50
eHQgKGxpbmUgMykpCiAgVXNpbmcgY2FjaGVkIHJlZmVyZW5jaW5nLTAuMzcuMC1weTMtbm9u
ZS1hbnkud2hsLm1ldGFkYXRhICgyLjgga0IpCkNvbGxlY3RpbmcgcnBkcy1weT49MC43LjEg
KGZyb20ganNvbnNjaGVtYT09NC4yMy4wLT4tciB0b29scy9iaW5tYW4vcmVxdWlyZW1lbnRz
LnR4dCAobGluZSAzKSkKICBVc2luZyBjYWNoZWQgcnBkc19weS0wLjMwLjAtY3AzMTItY3Az
MTItbWFueWxpbnV4XzJfMTdfYWFyY2g2NC5tYW55bGludXgyMDE0X2FhcmNoNjQud2hsLm1l
dGFkYXRhICg0LjEga0IpCkNvbGxlY3RpbmcgcGF0aHNwZWM+PTAuNS4zIChmcm9tIHlhbWxs
aW50PT0xLjM1LjEtPi1yIHRvb2xzL2Jpbm1hbi9yZXF1aXJlbWVudHMudHh0IChsaW5lIDYp
KQogIERvd25sb2FkaW5nIHBhdGhzcGVjLTEuMS4xLXB5My1ub25lLWFueS53aGwubWV0YWRh
dGEgKDE0IGtCKQpDb2xsZWN0aW5nIHB5eWFtbCAoZnJvbSB5YW1sbGludD09MS4zNS4xLT4t
ciB0b29scy9iaW5tYW4vcmVxdWlyZW1lbnRzLnR4dCAobGluZSA2KSkKICBVc2luZyBjYWNo
ZWQgcHl5YW1sLTYuMC4zLWNwMzEyLWNwMzEyLW1hbnlsaW51eDIwMTRfYWFyY2g2NC5tYW55
bGludXhfMl8xN19hYXJjaDY0Lm1hbnlsaW51eF8yXzI4X2FhcmNoNjQud2hsLm1ldGFkYXRh
ICgyLjQga0IpCkNvbGxlY3RpbmcgcHl0aG9uLXN1YnVuaXQgKGZyb20gY29uY3VycmVuY3l0
ZXN0PT0wLjEuMi0+LXIgdG9vbHMvdV9ib290X3B5bGliL3JlcXVpcmVtZW50cy50eHQgKGxp
bmUgMSkpCiAgVXNpbmcgY2FjaGVkIHB5dGhvbl9zdWJ1bml0LTEuNC41LXB5My1ub25lLWFu
eS53aGwubWV0YWRhdGEgKDIyIGtCKQpDb2xsZWN0aW5nIHRlc3R0b29scyAoZnJvbSBjb25j
dXJyZW5jeXRlc3Q9PTAuMS4yLT4tciB0b29scy91X2Jvb3RfcHlsaWIvcmVxdWlyZW1lbnRz
LnR4dCAobGluZSAxKSkKICBEb3dubG9hZGluZyB0ZXN0dG9vbHMtMi45LjEtcHkzLW5vbmUt
YW55LndobC5tZXRhZGF0YSAoNS40IGtCKQpDb2xsZWN0aW5nIHR5cGluZy1leHRlbnNpb25z
Pj00LjQuMCAoZnJvbSByZWZlcmVuY2luZz49MC4yOC40LT5qc29uc2NoZW1hPT00LjIzLjAt
Pi1yIHRvb2xzL2Jpbm1hbi9yZXF1aXJlbWVudHMudHh0IChsaW5lIDMpKQogIFVzaW5nIGNh
Y2hlZCB0eXBpbmdfZXh0ZW5zaW9ucy00LjE1LjAtcHkzLW5vbmUtYW55LndobC5tZXRhZGF0
YSAoMy4zIGtCKQpDb2xsZWN0aW5nIHB5IChmcm9tIHB5dGVzdC1mb3JrZWQtPnB5dGVzdC14
ZGlzdD09Mi41LjAtPi1yIHRlc3QvcHkvcmVxdWlyZW1lbnRzLnR4dCAobGluZSA0KSkKICBV
c2luZyBjYWNoZWQgcHktMS4xMS4wLXB5Mi5weTMtbm9uZS1hbnkud2hsLm1ldGFkYXRhICgy
Ljgga0IpCkNvbGxlY3RpbmcgaXNvODYwMSAoZnJvbSBweXRob24tc3VidW5pdC0+Y29uY3Vy
cmVuY3l0ZXN0PT0wLjEuMi0+LXIgdG9vbHMvdV9ib290X3B5bGliL3JlcXVpcmVtZW50cy50
eHQgKGxpbmUgMSkpCiAgVXNpbmcgY2FjaGVkIGlzbzg2MDEtMi4xLjAtcHkzLW5vbmUtYW55
LndobC5tZXRhZGF0YSAoMy43IGtCKQpVc2luZyBjYWNoZWQgZmlsZWxvY2stMy4yMC4zLXB5
My1ub25lLWFueS53aGwgKDE2IGtCKQpVc2luZyBjYWNoZWQgcHljcnlwdG9kb21leC0zLjIx
LjAtY3AzNi1hYmkzLW1hbnlsaW51eF8yXzE3X2FhcmNoNjQubWFueWxpbnV4MjAxNF9hYXJj
aDY0LndobCAoMi4yIE1CKQpVc2luZyBjYWNoZWQgcHl0ZXN0LTguNC4yLXB5My1ub25lLWFu
eS53aGwgKDM2NSBrQikKVXNpbmcgY2FjaGVkIHB5dGVzdF94ZGlzdC0yLjUuMC1weTMtbm9u
ZS1hbnkud2hsICg0MSBrQikKVXNpbmcgY2FjaGVkIEZBVHRvb2xzLTEuMC40Mi1weTMtbm9u
ZS1hbnkud2hsICgxMzIga0IpClVzaW5nIGNhY2hlZCBjb3ZlcmFnZS03LjguMC1jcDMxMi1j
cDMxMi1tYW55bGludXhfMl8xN19hYXJjaDY0Lm1hbnlsaW51eDIwMTRfYWFyY2g2NC53aGwg
KDI0NSBrQikKVXNpbmcgY2FjaGVkIGltcG9ydGxpYl9yZXNvdXJjZXMtNi41LjItcHkzLW5v
bmUtYW55LndobCAoMzcga0IpClVzaW5nIGNhY2hlZCBqc29uc2NoZW1hLTQuMjMuMC1weTMt
bm9uZS1hbnkud2hsICg4OCBrQikKVXNpbmcgY2FjaGVkIHB5ZWxmdG9vbHMtMC4zMS1weTMt
bm9uZS1hbnkud2hsICgxODAga0IpClVzaW5nIGNhY2hlZCB5YW1sbGludC0xLjM1LjEtcHkz
LW5vbmUtYW55LndobCAoNjYga0IpCkRvd25sb2FkaW5nIHNldHVwdG9vbHMtODIuMC4xLXB5
My1ub25lLWFueS53aGwgKDEuMCBNQikKICAg4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSBIDEuMC8xLjAgTUIgNy40
IE1CL3MgZXRhIDA6MDA6MDAKRG93bmxvYWRpbmcgYXR0cnMtMjYuMS4wLXB5My1ub25lLWFu
eS53aGwgKDY3IGtCKQogICDilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIEgNjcuNS82Ny41IGtCIDE0LjQgTUIvcyBl
dGEgMDowMDowMApVc2luZyBjYWNoZWQgZXhlY25ldC0yLjEuMi1weTMtbm9uZS1hbnkud2hs
ICg0MCBrQikKVXNpbmcgY2FjaGVkIGluaWNvbmZpZy0yLjMuMC1weTMtbm9uZS1hbnkud2hs
ICg3LjUga0IpClVzaW5nIGNhY2hlZCBqc29uc2NoZW1hX3NwZWNpZmljYXRpb25zLTIwMjUu
OS4xLXB5My1ub25lLWFueS53aGwgKDE4IGtCKQpEb3dubG9hZGluZyBwYWNrYWdpbmctMjYu
Mi1weTMtbm9uZS1hbnkud2hsICgxMDAga0IpCiAgIOKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgSAxMDAuMi8xMDAu
MiBrQiAxMS4zIE1CL3MgZXRhIDA6MDA6MDAKRG93bmxvYWRpbmcgcGF0aHNwZWMtMS4xLjEt
cHkzLW5vbmUtYW55LndobCAoNTcga0IpCiAgIOKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgSA1Ny4zLzU3LjMga0Ig
OS44IE1CL3MgZXRhIDA6MDA6MDAKVXNpbmcgY2FjaGVkIHBsdWdneS0xLjYuMC1weTMtbm9u
ZS1hbnkud2hsICgyMCBrQikKRG93bmxvYWRpbmcgcHlnbWVudHMtMi4yMC4wLXB5My1ub25l
LWFueS53aGwgKDEuMiBNQikKICAg4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSBIDEuMi8xLjIgTUIgOS45IE1CL3Mg
ZXRhIDA6MDA6MDAKVXNpbmcgY2FjaGVkIHJlZmVyZW5jaW5nLTAuMzcuMC1weTMtbm9uZS1h
bnkud2hsICgyNiBrQikKVXNpbmcgY2FjaGVkIHJwZHNfcHktMC4zMC4wLWNwMzEyLWNwMzEy
LW1hbnlsaW51eF8yXzE3X2FhcmNoNjQubWFueWxpbnV4MjAxNF9hYXJjaDY0LndobCAoMzkw
IGtCKQpVc2luZyBjYWNoZWQgcHl0ZXN0X2ZvcmtlZC0xLjYuMC1weTMtbm9uZS1hbnkud2hs
ICg0Ljkga0IpClVzaW5nIGNhY2hlZCBweXRob25fc3VidW5pdC0xLjQuNS1weTMtbm9uZS1h
bnkud2hsICgxMDIga0IpCkRvd25sb2FkaW5nIHRlc3R0b29scy0yLjkuMS1weTMtbm9uZS1h
bnkud2hsICgxMTAga0IpCiAgIOKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgSAxMTAuMy8xMTAuMyBrQiAxMy43IE1C
L3MgZXRhIDA6MDA6MDAKVXNpbmcgY2FjaGVkIHB5eWFtbC02LjAuMy1jcDMxMi1jcDMxMi1t
YW55bGludXgyMDE0X2FhcmNoNjQubWFueWxpbnV4XzJfMTdfYWFyY2g2NC5tYW55bGludXhf
Ml8yOF9hYXJjaDY0LndobCAoNzc1IGtCKQpVc2luZyBjYWNoZWQgdHlwaW5nX2V4dGVuc2lv
bnMtNC4xNS4wLXB5My1ub25lLWFueS53aGwgKDQ0IGtCKQpVc2luZyBjYWNoZWQgaXNvODYw
MS0yLjEuMC1weTMtbm9uZS1hbnkud2hsICg3LjUga0IpClVzaW5nIGNhY2hlZCBweS0xLjEx
LjAtcHkyLnB5My1ub25lLWFueS53aGwgKDk4IGtCKQpJbnN0YWxsaW5nIGNvbGxlY3RlZCBw
YWNrYWdlczogcHllbGZ0b29scywgaGV4ZHVtcCwgdHlwaW5nLWV4dGVuc2lvbnMsIHRlc3R0
b29scywgc2V0dXB0b29scywgcnBkcy1weSwgcHl5YW1sLCBweWdtZW50cywgcHljcnlwdG9k
b21leCwgcHksIHBsdWdneSwgcGF0aHNwZWMsIHBhY2thZ2luZywgaXNvODYwMSwgaW5pY29u
ZmlnLCBpbXBvcnRsaWJfcmVzb3VyY2VzLCBmaWxlbG9jaywgRkFUdG9vbHMsIGV4ZWNuZXQs
IGNvdmVyYWdlLCBhdHRycywgeWFtbGxpbnQsIHJlZmVyZW5jaW5nLCBweXRob24tc3VidW5p
dCwgcHl0ZXN0LCBweXRlc3QtZm9ya2VkLCBqc29uc2NoZW1hLXNwZWNpZmljYXRpb25zLCBj
b25jdXJyZW5jeXRlc3QsIHB5dGVzdC14ZGlzdCwganNvbnNjaGVtYQpTdWNjZXNzZnVsbHkg
aW5zdGFsbGVkIEZBVHRvb2xzLTEuMC40MiBhdHRycy0yNi4xLjAgY29uY3VycmVuY3l0ZXN0
LTAuMS4yIGNvdmVyYWdlLTcuOC4wIGV4ZWNuZXQtMi4xLjIgZmlsZWxvY2stMy4yMC4zIGhl
eGR1bXAtMy4zIGltcG9ydGxpYl9yZXNvdXJjZXMtNi41LjIgaW5pY29uZmlnLTIuMy4wIGlz
bzg2MDEtMi4xLjAganNvbnNjaGVtYS00LjIzLjAganNvbnNjaGVtYS1zcGVjaWZpY2F0aW9u
cy0yMDI1LjkuMSBwYWNrYWdpbmctMjYuMiBwYXRoc3BlYy0xLjEuMSBwbHVnZ3ktMS42LjAg
cHktMS4xMS4wIHB5Y3J5cHRvZG9tZXgtMy4yMS4wIHB5ZWxmdG9vbHMtMC4zMSBweWdtZW50
cy0yLjIwLjAgcHl0ZXN0LTguNC4yIHB5dGVzdC1mb3JrZWQtMS42LjAgcHl0ZXN0LXhkaXN0
LTIuNS4wIHB5dGhvbi1zdWJ1bml0LTEuNC41IHB5eWFtbC02LjAuMyByZWZlcmVuY2luZy0w
LjM3LjAgcnBkcy1weS0wLjMwLjAgc2V0dXB0b29scy04Mi4wLjEgdGVzdHRvb2xzLTIuOS4x
IHR5cGluZy1leHRlbnNpb25zLTQuMTUuMCB5YW1sbGludC0xLjM1LjEKG1szMjsxbSQgZXhw
b3J0IFVCT09UX1RSQVZJU19CVUlMRF9ESVI9L3RtcC8ke1RFU1RfUFlfQkR9G1swO20KG1sz
MjsxbSQgZWNobyBCVUlMRF9FTlYgJHtCVUlMRF9FTlZ9G1swO20KQlVJTERfRU5WChtbMzI7
MW0kIGlmIFsgLW4gIiR7QlVJTERfRU5WfSIgXTsgdGhlbiBleHBvcnQgJHtCVUlMRF9FTlZ9
OyBmaRtbMDttChtbMzI7MW0kIHRvb2xzL2J1aWxkbWFuL2J1aWxkbWFuIC1vICR7VUJPT1Rf
VFJBVklTX0JVSUxEX0RJUn0gLXcgLUUgLVcgLWUgLS1ib2FyZCAke1RFU1RfUFlfQkR9ICR7
T1ZFUlJJREV9G1swO20KQnVpbGRpbmcgY3VycmVudCBzb3VyY2UgZm9yIDEgYm9hcmRzICgx
IHRocmVhZCwgOCBqb2JzIHBlciB0aHJlYWQpCgpTdGFydGluZyBidWlsZC4uLgogICAgICAg
ICAgICAgICAgICAKCiAgICAwICAgIDAgICAgMCAvMSAgICAgICAtMSAgICAgIChzdGFydGlu
ZykKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKCiAgICAx
ICAgIDAgICAgMCAvMSAgICAgICAgICAgICAgcWVtdS1yaXNjdjMyCkNvbXBsZXRlZDogMSB0
b3RhbCBidWlsdCwgMSBuZXdseSksIGR1cmF0aW9uIDA6MDA6MTAsIHJhdGUgMC4xMAobWzMy
OzFtJCBjcCAvb3B0L2dydWIvZ3J1Yl94ODYuZWZpICRVQk9PVF9UUkFWSVNfQlVJTERfRElS
LxtbMDttChtbMzI7MW0kIGNwIC9vcHQvZ3J1Yi9ncnViX3g2NC5lZmkgJFVCT09UX1RSQVZJ
U19CVUlMRF9ESVIvG1swO20KG1szMjsxbSQgY3AgL29wdC9ncnViL2dydWJyaXNjdjY0LmVm
aSAkVUJPT1RfVFJBVklTX0JVSUxEX0RJUi9ncnViX3Jpc2N2NjQuZWZpG1swO20KG1szMjsx
bSQgY3AgL29wdC9ncnViL2dydWJhYTY0LmVmaSAkVUJPT1RfVFJBVklTX0JVSUxEX0RJUi9n
cnViX2FybTY0LmVmaRtbMDttChtbMzI7MW0kIGNwIC9vcHQvZ3J1Yi9ncnViYXJtLmVmaSAk
VUJPT1RfVFJBVklTX0JVSUxEX0RJUi9ncnViX2FybS5lZmkbWzA7bQobWzMyOzFtJCBpZiBb
WyAiJHtURVNUX1BZX0JEfSIgPT0gInNpZml2ZV91bmxlYXNoZWQiIF1dOyB0aGVuIG1rZGly
IC1wIHJvb3Q7IGNwICR7VUJPT1RfVFJBVklTX0JVSUxEX0RJUn0vc3BsL3UtYm9vdC1zcGwu
YmluIC47IGNwICR7VUJPT1RfVFJBVklTX0JVSUxEX0RJUn0vdS1ib290Lml0YiAuOyBybSAt
cmYgdG1wOyBnZW5pbWFnZSAtLWlucHV0cGF0aCAuIC0tY29uZmlnIGJvYXJkL3NpZml2ZS91
bmxlYXNoZWQvZ2VuaW1hZ2Vfc2RjYXJkLmNmZzsgY3AgaW1hZ2VzL3NkY2FyZC5pbWcgJHtV
Qk9PVF9UUkFWSVNfQlVJTERfRElSfS87IHJtIC1yZiB0bXA7IGdlbmltYWdlIC0taW5wdXRw
YXRoIC4gLS1jb25maWcgYm9hcmQvc2lmaXZlL3VubGVhc2hlZC9nZW5pbWFnZV9zcGktbm9y
LmNmZzsgY3AgaW1hZ2VzL3NwaS1ub3IuaW1nICR7VUJPT1RfVFJBVklTX0JVSUxEX0RJUn0v
OyBmaRtbMDttChtbMzI7MW0kIGlmIFtbICIke1RFU1RfUFlfQkR9IiA9PSAiY29yZWJvb3Qi
IF1dOyB0aGVuIGNwIC9vcHQvY29yZWJvb3QvY29yZWJvb3Qucm9tICR7VUJPT1RfVFJBVklT
X0JVSUxEX0RJUn0vY29yZWJvb3Qucm9tOyAvb3B0L2NvcmVib290L2NiZnN0b29sICR7VUJP
T1RfVFJBVklTX0JVSUxEX0RJUn0vY29yZWJvb3Qucm9tIHJlbW92ZSAtbiBmYWxsYmFjay9w
YXlsb2FkOyAvb3B0L2NvcmVib290L2NiZnN0b29sICR7VUJPT1RfVFJBVklTX0JVSUxEX0RJ
Un0vY29yZWJvb3Qucm9tIGFkZC1mbGF0LWJpbmFyeSAtZiAke1VCT09UX1RSQVZJU19CVUlM
RF9ESVJ9L3UtYm9vdC5iaW4gLW4gZmFsbGJhY2svcGF5bG9hZCAtYyBMWk1BIC1sIDB4MTEx
MDAwMCAtZSAweDExMTAwMDA7IGZpG1swO20KG1szMjsxbSQgdGZhX2Rpcj0iIhtbMDttChtb
MzI7MW0kIHJtIC1mIC90bXAvZmlwLmJpbhtbMDttChtbMzI7MW0kIHJtIC1mIC90bXAvYmwx
LmJpbhtbMDttChtbMzI7MW0kIGlmIFtbIC1kIC9vcHQvdGYtYS8iJHtURVNUX1BZX0JEfSR7
VEVTVF9QWV9JRC8vLS1pZCAvX30iIF1dOyB0aGVuIHRmYV9kaXI9Ii9vcHQvdGYtYS8ke1RF
U1RfUFlfQkR9JHtURVNUX1BZX0lELy8tLWlkIC9ffSI7IGVsaWYgW1sgLWQgL29wdC90Zi1h
LyIke1RFU1RfUFlfQkR9IiBdXTsgdGhlbiB0ZmFfZGlyPSIvb3B0L3RmLWEvJHtURVNUX1BZ
X0JEfSI7IGZpG1swO20KG1szMjsxbSQgaWYgW1sgLW4gIiR0ZmFfZGlyIiBdXTsgdGhlbiBj
cCAiJHRmYV9kaXIiL2ZpcC5iaW4gIiR0ZmFfZGlyIi9ibDEuYmluIC90bXAvOyBmaRtbMDtt
ChtbMzI7MW0kIGlmIFsgLWYgL3RtcC9maXAuYmluIF0gJiYgWyAtZiAvdG1wL2JsMS5iaW4g
XTsgdGhlbiBleHBvcnQgZmlwPS90bXAvZmlwLmJpbjsgZXhwb3J0IGJsMT0vdG1wL2JsMS5i
aW47IGV4cG9ydCBQQVRIPS9vcHQvQmFzZV9SZXZDX0FFTXZBX3BrZy9tb2RlbHMvTGludXg2
NF9HQ0MtOS4zOiR7UEFUSH07IGZpG1swO20KG1szMjsxbSQgZXhwb3J0IFBBVEg9L29wdC9x
ZW11L2JpbjovdG1wL3Vib290LXRlc3QtaG9va3MvYmluOiR7UEFUSH07IGV4cG9ydCBQWVRI
T05QQVRIPS90bXAvdWJvb3QtdGVzdC1ob29rcy9weS90cmF2aXMtY2k7IHB5dGhvbjMgLW0g
aHR0cC5zZXJ2ZXIgODAgLS1kaXJlY3RvcnkgIiR7VUJPT1RfVFJBVklTX0JVSUxEX0RJUn0i
ID4gL2Rldi9udWxsIDI+JjEgJiBIVFRQX1BJRD0kITsgc2xlZXAgMTsgaWYgcHMgLXAgJHtI
VFRQX1BJRH0gPiAvZGV2L251bGw7IHRoZW4gZXhwb3J0IEhUVFBfUElEOyBlbHNlIHVuc2V0
IEhUVFBfUElEOyBmaTsgLi90ZXN0L3B5L3Rlc3QucHkgLXJhIC0tYmQgJHtURVNUX1BZX0JE
fSAke1RFU1RfUFlfSUR9ICR7VEVTVF9QWV9FWFRSQX0gJHtURVNUX1BZX1RFU1RfU1BFQzor
Ii1rICR7VEVTVF9QWV9URVNUX1NQRUN9In0gLS1idWlsZC1kaXIgIiRVQk9PVF9UUkFWSVNf
QlVJTERfRElSIiAtLWp1bml0eG1sPS90bXAvJHtURVNUX1BZX0JEfS9yZXN1bHRzLnhtbDsg
aWYgW1sgLW4gIiR7SFRUUF9QSUR9IiBdXTsgdGhlbiBraWxsICR7SFRUUF9QSUR9OyBmaRtb
MDttCit1LWJvb3QtdGVzdC1mbGFzaCBxZW11LXJpc2N2MzIgbmEKPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0gdGVzdCBzZXNzaW9uIHN0YXJ0cyA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KcGxhdGZvcm0gbGludXggLS0gUHl0aG9uIDMuMTIuMywgcHl0ZXN0LTgu
NC4yLCBwbHVnZ3ktMS42LjAKcm9vdGRpcjogL2J1aWxkcy91LWJvb3QvY3VzdG9kaWFucy91
LWJvb3Qtc3RtL3Rlc3QvcHkKY29uZmlnZmlsZTogcHl0ZXN0LmluaQpwbHVnaW5zOiBmb3Jr
ZWQtMS42LjAsIHhkaXN0LTIuNS4wCmNvbGxlY3RlZCA3OTcgaXRlbXMgLyAyIGRlc2VsZWN0
ZWQgLyA3OTUgc2VsZWN0ZWQKCnRlc3QvcHkvdGVzdHMvdGVzdF8wMDBfdmVyc2lvbi5weSAu
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbICAwJV0KdGVzdC9weS90
ZXN0cy90ZXN0X2FuZHJvaWQvdGVzdF9hYi5weSBzICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFsgIDAlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfYW5kcm9pZC90ZXN0X2Fib290
aW1nLnB5IHNzcyAgICAgICAgICAgICAgICAgICAgICAgICAgWyAgMCVdCnRlc3QvcHkvdGVz
dHMvdGVzdF9hbmRyb2lkL3Rlc3RfYXZiLnB5IHNzc3NzcyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBbICAxJV0KdGVzdC9weS90ZXN0cy90ZXN0X2JpbmQucHkgc3MgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgIDElXQp0ZXN0L3B5L3Rlc3Rz
L3Rlc3RfYm9vdG1lbnUucHkgcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgWyAgMSVdCnRlc3QvcHkvdGVzdHMvdGVzdF9ib290c3RhZ2UucHkgc3MgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbICAyJV0KdGVzdC9weS90ZXN0cy90
ZXN0X2J1dHRvbi5weSBzcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFsgIDIlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfY2F0LnB5IHMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyAgMiVdCnRlc3QvcHkvdGVzdHMvdGVz
dF9jbGVhbnVwX2J1aWxkLnB5IC4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBbICAyJV0KdGVzdC9weS90ZXN0cy90ZXN0X2RmdS5weSBzICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgIDIlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3Rf
ZGlzdHJvLnB5IHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
WyAgMiVdCnRlc3QvcHkvdGVzdHMvdGVzdF9kbS5weSAuLi4uLiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBbICAzJV0KdGVzdC9weS90ZXN0cy90ZXN0X2Vm
aV9ib290bWdyLnB5IHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsg
IDMlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfZWZpX2NhcHN1bGUvdGVzdF9jYXBzdWxlX2Zpcm13
YXJlX2ZpdC5weSBzc3NzICAgICAgICAgWyAgNCVdCnRlc3QvcHkvdGVzdHMvdGVzdF9lZmlf
Y2Fwc3VsZS90ZXN0X2NhcHN1bGVfZmlybXdhcmVfcmF3LnB5IHNzc3NzICAgICAgICBbICA0
JV0KdGVzdC9weS90ZXN0cy90ZXN0X2VmaV9jYXBzdWxlL3Rlc3RfY2Fwc3VsZV9maXJtd2Fy
ZV9zaWduZWRfZml0LnB5IHNzc3NzIFsgIDUlXQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyAgNSVd
CnRlc3QvcHkvdGVzdHMvdGVzdF9lZmlfY2Fwc3VsZS90ZXN0X2NhcHN1bGVfZmlybXdhcmVf
c2lnbmVkX3Jhdy5weSBzc3NzcyBbICA2JV0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgIDYlXQp0
ZXN0L3B5L3Rlc3RzL3Rlc3RfZWZpX2VjcHQucHkgc3MgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgWyAgNiVdCnRlc3QvcHkvdGVzdHMvdGVzdF9lZmlfZml0LnB5
IC4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbICA2JV0KdGVz
dC9weS90ZXN0cy90ZXN0X2VmaV9sb2FkZXIucHkgLi4uLnMucyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFsgIDclXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfZWZpX3NlY2Jvb3Qv
dGVzdF9hdXRodmFyLnB5IHNzc3NzICAgICAgICAgICAgICAgICAgICAgWyAgNyVdCnRlc3Qv
cHkvdGVzdHMvdGVzdF9lZmlfc2VjYm9vdC90ZXN0X3NpZ25lZC5weSBzc3Nzc3NzcyAgICAg
ICAgICAgICAgICAgICBbICA4JV0KdGVzdC9weS90ZXN0cy90ZXN0X2VmaV9zZWNib290L3Rl
c3Rfc2lnbmVkX2ludGNhLnB5IHNzcyAgICAgICAgICAgICAgICAgIFsgIDklXQp0ZXN0L3B5
L3Rlc3RzL3Rlc3RfZWZpX3NlY2Jvb3QvdGVzdF91bnNpZ25lZC5weSBzc3MgICAgICAgICAg
ICAgICAgICAgICAgWyAgOSVdCnRlc3QvcHkvdGVzdHMvdGVzdF9lZmlfc2VsZnRlc3QucHkg
Li4uLi5zICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIDEwJV0KdGVzdC9weS90
ZXN0cy90ZXN0X2VmaWNvbmZpZy5weSBzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFsgMTAlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfZW52LnB5IHMuLi4uLi4uLi4u
Li5zc3NzLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyAxMiVdCnRlc3QvcHkvdGVz
dHMvdGVzdF9ldmVudF9kdW1wLnB5IHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBbIDEyJV0KdGVzdC9weS90ZXN0cy90ZXN0X2V4dGVuc2lvbi5weSBzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgMTMlXQp0ZXN0L3B5L3Rlc3Rz
L3Rlc3RfZml0LnB5IHNzc3NzcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgWyAxMyVdCnRlc3QvcHkvdGVzdHMvdGVzdF9maXRfYXV0b19zaWduZWQucHkgcyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIDEzJV0KdGVzdC9weS90ZXN0cy90
ZXN0X2ZpdF9lY2RzYS5weSBzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFsgMTQlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfZml0X2hhc2hlcy5weSAuICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyAxNCVdCnRlc3QvcHkvdGVzdHMvdGVz
dF9maXRfbWtpbWFnZV92YWxpZGF0ZS5weSBzcyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBbIDE0JV0KdGVzdC9weS90ZXN0cy90ZXN0X2ZwZ2EucHkgc3Nzc3Nzc3Nzc3Nzc3Nzc3Nz
c3Nzc3Nzc3NzcyAgICAgICAgICAgICAgICAgIFsgMTclXQp0ZXN0L3B5L3Rlc3RzL3Rlc3Rf
ZnMvdGVzdF9iYXNpYy5weSBzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Mg
WyAyMiVdCnNzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3NzICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBbIDI2JV0KdGVzdC9weS90ZXN0cy90ZXN0X2Zz
L3Rlc3RfZXJvZnMucHkgcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsg
MjYlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfZnMvdGVzdF9leHQucHkgc3Nzc3Nzc3Nzc3Nzc3Nz
c3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3MgWyAzMSVdCnNzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Mg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIDMz
JV0KdGVzdC9weS90ZXN0cy90ZXN0X2ZzL3Rlc3RfZnNfY21kLnB5IHMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFsgMzMlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfZnMvdGVz
dF9mc19mYXQucHkgc3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyAzNCVd
CnRlc3QvcHkvdGVzdHMvdGVzdF9mcy90ZXN0X21rZGlyLnB5IHNzc3Nzc3Nzc3Nzc3Nzc3Nz
c3Nzc3Nzc3Nzc3NzcyAgICAgICBbIDM3JV0KdGVzdC9weS90ZXN0cy90ZXN0X2ZzL3Rlc3Rf
cmVuYW1lLnB5IHNzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3NzIFsgNDIlXQpz
c3Nzc3Nzc3Nzc3Nzc3Nzc3NzcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgWyA0NCVdCnRlc3QvcHkvdGVzdHMvdGVzdF9mcy90ZXN0X3Nx
dWFzaGZzL3Rlc3Rfc3Fmc19sb2FkLnB5IHMgICAgICAgICAgICAgICAgICBbIDQ1JV0KdGVz
dC9weS90ZXN0cy90ZXN0X2ZzL3Rlc3Rfc3F1YXNoZnMvdGVzdF9zcWZzX2xzLnB5IHMgICAg
ICAgICAgICAgICAgICAgIFsgNDUlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfZnMvdGVzdF9zeW1s
aW5rLnB5IHNzc3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyA0NSVdCnRlc3Qv
cHkvdGVzdHMvdGVzdF9mcy90ZXN0X3VubGluay5weSBzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nz
c3Nzc3Nzc3Nzc3NzcyBbIDUwJV0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgNTAlXQp0ZXN0L3B5
L3Rlc3RzL3Rlc3RfZndfaGFuZG9mZi5weSBzcyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgWyA1MCVdCnRlc3QvcHkvdGVzdHMvdGVzdF9ncGlvLnB5IHNzc3Nzc3Nz
c3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIDUxJV0KdGVzdC9weS90
ZXN0cy90ZXN0X2dwdC5weSBzc3Nzc3Nzc3Nzc3Nzc3MgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFsgNTMlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfaGFuZG9mZi5weSBzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyA1MyVdCnRlc3QvcHkvdGVz
dHMvdGVzdF9oZWxwLnB5IC5zcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBbIDUzJV0KdGVzdC9weS90ZXN0cy90ZXN0X2kyYy5weSBzc3NzcyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgNTQlXQp0ZXN0L3B5L3Rlc3Rz
L3Rlc3Rfa2NvbmZpZy5weSBzcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgWyA1NCVdCnRlc3QvcHkvdGVzdHMvdGVzdF9sb2cucHkgc3MgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIDU1JV0KdGVzdC9weS90ZXN0cy90
ZXN0X2xzYmxrLnB5IHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFsgNTUlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfbWQucHkgLi4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyA1NSVdCnRlc3QvcHkvdGVzdHMvdGVz
dF9tZGlvLnB5IHNzcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBbIDU1JV0KdGVzdC9weS90ZXN0cy90ZXN0X21lbXRlc3QucHkgc3MgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgNTYlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3Rf
bWlpLnB5IHNzc3NzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
WyA1NiVdCnRlc3QvcHkvdGVzdHMvdGVzdF9tbWMucHkgc3Nzc3Nzc3Nzc3Nzc3NzcyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBbIDU4JV0KdGVzdC9weS90ZXN0cy90ZXN0X21t
Y19yZC5weSBzc3NzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsg
NTklXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfbW1jX3dyLnB5IHMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgWyA1OSVdCnRlc3QvcHkvdGVzdHMvdGVzdF9uZXQu
cHkgLi5zc3Mucy5zc3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIDYw
JV0KdGVzdC9weS90ZXN0cy90ZXN0X25ldF9ib290LnB5IHNzc3MgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFsgNjElXQp0ZXN0L3B5L3Rlc3RzL3Rlc3Rfb2ZwbGF0
ZGF0YS5weSBzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyA2MSVd
CnRlc3QvcHkvdGVzdHMvdGVzdF9vcHRlZV9ycG1iLnB5IHMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBbIDYxJV0KdGVzdC9weS90ZXN0cy90ZXN0X3BhcnQucHkg
LiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgNjElXQp0
ZXN0L3B5L3Rlc3RzL3Rlc3RfcGlubXV4LnB5IHNzc3Nzc3MgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgWyA2MiVdCnRlc3QvcHkvdGVzdHMvdGVzdF9wc3RvcmUucHkg
c3NzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIDYyJV0KdGVz
dC9weS90ZXN0cy90ZXN0X3Fmdy5weSBzcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFsgNjMlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfcmVzZXQucHkgc3Mg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyA2MyVdCnRlc3Qv
cHkvdGVzdHMvdGVzdF9zYW5kYm94X2V4aXQucHkgc3NzcyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBbIDYzJV0KdGVzdC9weS90ZXN0cy90ZXN0X3NhbmRib3hfb3B0cy5w
eSBzcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgNjQlXQp0ZXN0L3B5
L3Rlc3RzL3Rlc3Rfc2F2ZWVudi5weSBzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgWyA2NCVdCnRlc3QvcHkvdGVzdHMvdGVzdF9zY3AwMy5weSBzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIDY0JV0KdGVzdC9weS90
ZXN0cy90ZXN0X3Njc2kucHkgc3NzcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFsgNjQlXQp0ZXN0L3B5L3Rlc3RzL3Rlc3Rfc2VtaWhvc3RpbmcvdGVzdF9o
b3N0ZnMucHkgcyAgICAgICAgICAgICAgICAgICAgICAgICAgWyA2NSVdCnRlc3QvcHkvdGVz
dHMvdGVzdF9zZi5weSBzc3NzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBbIDY1JV0KdGVzdC9weS90ZXN0cy90ZXN0X3NoZWxsX2Jhc2ljcy5weSAuLi4u
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgNjYlXQp0ZXN0L3B5L3Rlc3Rz
L3Rlc3Rfc21iaW9zLnB5IHNzc3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgWyA2NiVdCnRlc3QvcHkvdGVzdHMvdGVzdF9zb3VyY2UucHkgcyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIDY2JV0KdGVzdC9weS90ZXN0cy90
ZXN0X3NwaS5weSBzc3Nzc3NzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFsgNjclXQp0ZXN0L3B5L3Rlc3RzL3Rlc3Rfc3BsLnB5IHNzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyA2NyVdCnRlc3QvcHkvdGVzdHMvdGVz
dF9zdGFja3Byb3RlY3Rvci5weSBzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBbIDY3JV0KdGVzdC9weS90ZXN0cy90ZXN0X3RwbTIucHkgc3Nzc3Nzc3NzICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgNjklXQp0ZXN0L3B5L3Rlc3RzL3Rlc3Rf
dHJhY2UucHkgcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
WyA2OSVdCnRlc3QvcHkvdGVzdHMvdGVzdF91bXMucHkgcyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBbIDY5JV0KdGVzdC9weS90ZXN0cy90ZXN0X3Vu
a25vd25fY21kLnB5IC4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsg
NjklXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfdXBsLnB5IHMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgWyA2OSVdCnRlc3QvcHkvdGVzdHMvdGVzdF91c2Iu
cHkgc3Nzc3Nzc3Nzc3Nzc3Nzc3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIDcx
JV0KdGVzdC9weS90ZXN0cy90ZXN0X3V0LnB5IHNzLi4uLkZGRi4uLi4uLi4uLi4uLi4ucy4u
Li4uLi4uLnMuLi4uLi4uLi4uLi4uIFsgNzclXQouLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4gWyA4NiVd
Ci4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uICAgICAgICAgICBbIDk0JV0KdGVzdC9weS90ZXN0cy90ZXN0X3ZiZS5weSBz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgOTQlXQp0
ZXN0L3B5L3Rlc3RzL3Rlc3RfdmJlX3ZwbC5weSBzICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgWyA5NCVdCnRlc3QvcHkvdGVzdHMvdGVzdF92Ym9vdC5weSBz
c3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3MgICAgICAgICAgICAgICBbIDk4JV0KdGVz
dC9weS90ZXN0cy90ZXN0X3ZwbC5weSBzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFsgOTglXQp0ZXN0L3B5L3Rlc3RzL3Rlc3RfeHhkLnB5IHMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyA5OCVdCnRlc3Qv
cHkvdGVzdHMvdGVzdF96eW5xX3NlY3VyZS5weSBzc3NzcyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBbIDk5JV0KdGVzdC9weS90ZXN0cy90ZXN0X3p5bnFtcF9ycHUucHkg
c3NzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgOTklXQp0ZXN0L3B5
L3Rlc3RzL3Rlc3RfenlucW1wX3NlY3VyZS5weSBzcyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgWzEwMCVdCgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PSBGQUlMVVJFUyA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpfX19fX19f
X19fX19fX19fX19fX18gdGVzdF91dFt1dF9jbWRfY21kX3Rlc3RfcGFydF9udW1iZXJdIF9f
X19fX19fX19fX19fX19fX19fXwp0ZXN0L3B5L3Rlc3RzL3Rlc3RfdXQucHk6NjU5OiBpbiB0
ZXN0X3V0CiAgICBhc3NlcnQgb3V0cHV0LmVuZHN3aXRoKCdmYWlsdXJlczogMCcpCkUgICBh
c3NlcnQgRmFsc2UKRSAgICArICB3aGVyZSBGYWxzZSA9IDxidWlsdC1pbiBtZXRob2QgZW5k
c3dpdGggb2Ygc3RyIG9iamVjdCBhdCAweGZmZmY0ZDkzOGI3MD4oJ2ZhaWx1cmVzOiAwJykK
RSAgICArICAgIHdoZXJlIDxidWlsdC1pbiBtZXRob2QgZW5kc3dpdGggb2Ygc3RyIG9iamVj
dCBhdCAweGZmZmY0ZDkzOGI3MD4gPSAnVGVzdDogcGFydF9udW1iZXI6IHBhcnQuY1xyXHJc
bnRlc3QvY21kL3BhcnQuYzo0Niwgc2V0dXBfZ3B0X3BhcnRpdGlvbnMoKTogbW1jX2Rldl9u
dW0gPT0gYmxrX2dldF9kZXZpY2VfYnlfc3RyKCJtbWMiLi4ubWJlclwnIGZhaWxlZCAyIHRp
bWVzXHJcclxuVGVzdHMgcnVuOiAxLCAxIG1zLCBhdmVyYWdlOiAxIG1zLCBmYWlsdXJlczog
MlxyXHJcbmV4aXQgbm90IGFsbG93ZWQgZnJvbSBtYWluIGlucHV0IHNoZWxsLicuZW5kc3dp
dGgKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gQ2FwdHVyZWQgc3Rkb3V0IGNhbGwg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPT4gdXQgY21kIGNtZF90ZXN0X3BhcnRf
bnVtYmVyCgpUZXN0OiBwYXJ0X251bWJlcjogcGFydC5jCgp0ZXN0L2NtZC9wYXJ0LmM6NDYs
IHNldHVwX2dwdF9wYXJ0aXRpb25zKCk6IG1tY19kZXZfbnVtID09IGJsa19nZXRfZGV2aWNl
X2J5X3N0cigibW1jIiwgZGV2X3N0ciwgJm1tY19kZXZfZGVzYyk6IEV4cGVjdGVkIDB4MiAo
MiksIGdvdCAweGZmZmZmZmVkICgtMTkpCgp0ZXN0L2NtZC9wYXJ0LmM6NjgsIGNtZF90ZXN0
X3BhcnRfbnVtYmVyKCk6IDAgPT0gc2V0dXBfZ3B0X3BhcnRpdGlvbnModXRzLCBtbWNfZGV2
X251bSk6IEV4cGVjdGVkIDB4MCAoMCksIGdvdCAweDEgKDEpCgpUZXN0ICdwYXJ0X251bWJl
cicgZmFpbGVkIDIgdGltZXMKClRlc3RzIHJ1bjogMSwgMSBtcywgYXZlcmFnZTogMSBtcywg
ZmFpbHVyZXM6IDIKCmV4aXQgbm90IGFsbG93ZWQgZnJvbSBtYWluIGlucHV0IHNoZWxsLgoK
PT4gCl9fX19fX19fX19fX19fX19fX19fX18gdGVzdF91dFt1dF9jbWRfY21kX3Rlc3RfcGFy
dF9zaXplXSBfX19fX19fX19fX19fX19fX19fX19fCnRlc3QvcHkvdGVzdHMvdGVzdF91dC5w
eTo2NTk6IGluIHRlc3RfdXQKICAgIGFzc2VydCBvdXRwdXQuZW5kc3dpdGgoJ2ZhaWx1cmVz
OiAwJykKRSAgIGFzc2VydCBGYWxzZQpFICAgICsgIHdoZXJlIEZhbHNlID0gPGJ1aWx0LWlu
IG1ldGhvZCBlbmRzd2l0aCBvZiBzdHIgb2JqZWN0IGF0IDB4ZmZmZjRlMjc3ZGQwPignZmFp
bHVyZXM6IDAnKQpFICAgICsgICAgd2hlcmUgPGJ1aWx0LWluIG1ldGhvZCBlbmRzd2l0aCBv
ZiBzdHIgb2JqZWN0IGF0IDB4ZmZmZjRlMjc3ZGQwPiA9ICdUZXN0OiBwYXJ0X3NpemU6IHBh
cnQuY1xyXHJcbnRlc3QvY21kL3BhcnQuYzo0Niwgc2V0dXBfZ3B0X3BhcnRpdGlvbnMoKTog
bW1jX2Rldl9udW0gPT0gYmxrX2dldF9kZXZpY2VfYnlfc3RyKCJtbWMiLCAuLi5zaXplXCcg
ZmFpbGVkIDIgdGltZXNcclxyXG5UZXN0cyBydW46IDEsIDEgbXMsIGF2ZXJhZ2U6IDEgbXMs
IGZhaWx1cmVzOiAyXHJcclxuZXhpdCBub3QgYWxsb3dlZCBmcm9tIG1haW4gaW5wdXQgc2hl
bGwuJy5lbmRzd2l0aAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIENhcHR1cmVkIHN0
ZG91dCBzZXR1cCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQordS1ib290LXRlc3Qt
cmVzZXQgcWVtdS1yaXNjdjMyIG5hCgoKCgpVLUJvb3QgMjAyNi4wNy1yYzEtZzMzOTYxZWUx
MmU5OCAoQXByIDI5IDIwMjYgLSAwODoyMToyMSArMDAwMCkKCgoKQ1BVOiAgIHJpc2N2CgpN
b2RlbDogcmlzY3YtdmlydGlvLHFlbXUKCkRSQU06ICAxIEdpQgoKdXNpbmcgbWVtb3J5IDB4
YmVlZDkwMDAtMHhiZjZmOTAwMCBmb3IgbWFsbG9jKCkKCkNvcmU6ICAyNyBkZXZpY2VzLCAx
MyB1Y2xhc3NlcywgZGV2aWNldHJlZTogYm9hcmQKCkZsYXNoOiAzMiBNaUIKCkxvYWRpbmcg
RW52aXJvbm1lbnQgZnJvbSBub3doZXJlLi4uIE9LCgpJbjogICAgc2VyaWFsLHVzYmtiZAoK
T3V0OiAgIHNlcmlhbCx2aWRjb25zb2xlCgpFcnI6ICAgc2VyaWFsLHZpZGNvbnNvbGUKCk5v
IFVTQiBjb250cm9sbGVycyBmb3VuZAoKTmV0OiAgIGV0aDA6IHZpcnRpby1uZXQjMAoKG1s/
MjVoCgobWzJLCkhpdCBhbnkga2V5IHRvIHN0b3AgYXV0b2Jvb3Q6IDIbWzJLCkhpdCBhbnkg
a2V5IHRvIHN0b3AgYXV0b2Jvb3Q6IDAKCj0+IAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSBDYXB0dXJlZCBzdGRvdXQgY2FsbCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo9PiAgdXQgY21kIGNtZF90ZXN0X3BhcnRfc2l6ZQoKVGVzdDogcGFydF9zaXplOiBwYXJ0
LmMKCnRlc3QvY21kL3BhcnQuYzo0Niwgc2V0dXBfZ3B0X3BhcnRpdGlvbnMoKTogbW1jX2Rl
dl9udW0gPT0gYmxrX2dldF9kZXZpY2VfYnlfc3RyKCJtbWMiLCBkZXZfc3RyLCAmbW1jX2Rl
dl9kZXNjKTogRXhwZWN0ZWQgMHgyICgyKSwgZ290IDB4ZmZmZmZmZWQgKC0xOSkKCnRlc3Qv
Y21kL3BhcnQuYzoxNjIsIGNtZF90ZXN0X3BhcnRfc2l6ZSgpOiAwID09IHNldHVwX2dwdF9w
YXJ0aXRpb25zKHV0cywgbW1jX2Rldl9udW0pOiBFeHBlY3RlZCAweDAgKDApLCBnb3QgMHgx
ICgxKQoKVGVzdCAncGFydF9zaXplJyBmYWlsZWQgMiB0aW1lcwoKVGVzdHMgcnVuOiAxLCAx
IG1zLCBhdmVyYWdlOiAxIG1zLCBmYWlsdXJlczogMgoKZXhpdCBub3QgYWxsb3dlZCBmcm9t
IG1haW4gaW5wdXQgc2hlbGwuCgo9PiAKX19fX19fX19fX19fX19fX19fX19fIHRlc3RfdXRb
dXRfY21kX2NtZF90ZXN0X3BhcnRfc3RhcnRdIF9fX19fX19fX19fX19fX19fX19fX18KdGVz
dC9weS90ZXN0cy90ZXN0X3V0LnB5OjY1OTogaW4gdGVzdF91dAogICAgYXNzZXJ0IG91dHB1
dC5lbmRzd2l0aCgnZmFpbHVyZXM6IDAnKQpFICAgYXNzZXJ0IEZhbHNlCkUgICAgKyAgd2hl
cmUgRmFsc2UgPSA8YnVpbHQtaW4gbWV0aG9kIGVuZHN3aXRoIG9mIHN0ciBvYmplY3QgYXQg
MHhmZmZmNGQ5MzkyZjA+KCdmYWlsdXJlczogMCcpCkUgICAgKyAgICB3aGVyZSA8YnVpbHQt
aW4gbWV0aG9kIGVuZHN3aXRoIG9mIHN0ciBvYmplY3QgYXQgMHhmZmZmNGQ5MzkyZjA+ID0g
J1Rlc3Q6IHBhcnRfc3RhcnQ6IHBhcnQuY1xyXHJcbnRlc3QvY21kL3BhcnQuYzo0Niwgc2V0
dXBfZ3B0X3BhcnRpdGlvbnMoKTogbW1jX2Rldl9udW0gPT0gYmxrX2dldF9kZXZpY2VfYnlf
c3RyKCJtbWMiLC4uLnRhcnRcJyBmYWlsZWQgMiB0aW1lc1xyXHJcblRlc3RzIHJ1bjogMSwg
MiBtcywgYXZlcmFnZTogMiBtcywgZmFpbHVyZXM6IDJcclxyXG5leGl0IG5vdCBhbGxvd2Vk
IGZyb20gbWFpbiBpbnB1dCBzaGVsbC4nLmVuZHN3aXRoCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0gQ2FwdHVyZWQgc3Rkb3V0IHNldHVwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCit1LWJvb3QtdGVzdC1yZXNldCBxZW11LXJpc2N2MzIgbmEKCgoKClUtQm9vdCAy
MDI2LjA3LXJjMS1nMzM5NjFlZTEyZTk4IChBcHIgMjkgMjAyNiAtIDA4OjIxOjIxICswMDAw
KQoKCgpDUFU6ICAgcmlzY3YKCk1vZGVsOiByaXNjdi12aXJ0aW8scWVtdQoKRFJBTTogIDEg
R2lCCgp1c2luZyBtZW1vcnkgMHhiZWVkOTAwMC0weGJmNmY5MDAwIGZvciBtYWxsb2MoKQoK
Q29yZTogIDI3IGRldmljZXMsIDEzIHVjbGFzc2VzLCBkZXZpY2V0cmVlOiBib2FyZAoKRmxh
c2g6IDMyIE1pQgoKTG9hZGluZyBFbnZpcm9ubWVudCBmcm9tIG5vd2hlcmUuLi4gT0sKCklu
OiAgICBzZXJpYWwsdXNia2JkCgpPdXQ6ICAgc2VyaWFsLHZpZGNvbnNvbGUKCkVycjogICBz
ZXJpYWwsdmlkY29uc29sZQoKTm8gVVNCIGNvbnRyb2xsZXJzIGZvdW5kCgpOZXQ6ICAgZXRo
MDogdmlydGlvLW5ldCMwCgobWz8yNWgKChtbMksKSGl0IGFueSBrZXkgdG8gc3RvcCBhdXRv
Ym9vdDogMhtbMksKSGl0IGFueSBrZXkgdG8gc3RvcCBhdXRvYm9vdDogMAoKPT4gCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIENhcHR1cmVkIHN0ZG91dCBjYWxsIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj0+ICB1dCBjbWQgY21kX3Rlc3RfcGFydF9zdGFydAoK
VGVzdDogcGFydF9zdGFydDogcGFydC5jCgp0ZXN0L2NtZC9wYXJ0LmM6NDYsIHNldHVwX2dw
dF9wYXJ0aXRpb25zKCk6IG1tY19kZXZfbnVtID09IGJsa19nZXRfZGV2aWNlX2J5X3N0cigi
bW1jIiwgZGV2X3N0ciwgJm1tY19kZXZfZGVzYyk6IEV4cGVjdGVkIDB4MiAoMiksIGdvdCAw
eGZmZmZmZmVkICgtMTkpCgp0ZXN0L2NtZC9wYXJ0LmM6MTA3LCBjbWRfdGVzdF9wYXJ0X3N0
YXJ0KCk6IDAgPT0gc2V0dXBfZ3B0X3BhcnRpdGlvbnModXRzLCBtbWNfZGV2X251bSk6IEV4
cGVjdGVkIDB4MCAoMCksIGdvdCAweDEgKDEpCgpUZXN0ICdwYXJ0X3N0YXJ0JyBmYWlsZWQg
MiB0aW1lcwoKVGVzdHMgcnVuOiAxLCAyIG1zLCBhdmVyYWdlOiAyIG1zLCBmYWlsdXJlczog
MgoKZXhpdCBub3QgYWxsb3dlZCBmcm9tIG1haW4gaW5wdXQgc2hlbGwuCgo9PiAKLS0tLS0t
LS0tLS0tLS0gZ2VuZXJhdGVkIHhtbCBmaWxlOiAvdG1wL3FlbXUtcmlzY3YzMi9yZXN1bHRz
LnhtbCAtLS0tLS0tLS0tLS0tLS0KPT09PT09PT09PT09PT09PT09PT09PT09PT09IHNob3J0
IHRlc3Qgc3VtbWFyeSBpbmZvID09PT09PT09PT09PT09PT09PT09PT09PT09PT0KU0tJUFBF
RCBbMzg5XSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjY5ODogYm9hcmQgInFlbXUtcmlzY3YzMiIg
bm90IHN1cHBvcnRlZApTS0lQUEVEIFsxN10gdGVzdC9weS9jb25mdGVzdC5weTo3MjE6IC5j
b25maWcgZmVhdHVyZXMgImNtZF9tbWMiIG5vdCBlbmFibGVkClNLSVBQRUQgWzJdIHRlc3Qv
cHkvY29uZnRlc3QucHk6NzIxOiAuY29uZmlnIGZlYXR1cmVzICJjbWRfYXZiIiBub3QgZW5h
YmxlZApTS0lQUEVEIFsxXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0
dXJlcyAib3B0ZWVfdGFfYXZiIiBub3QgZW5hYmxlZApTS0lQUEVEIFsxXSB0ZXN0L3B5L2Nv
bmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0dXJlcyAiY21kX2Jvb3RtZW51IiBub3QgZW5h
YmxlZApTS0lQUEVEIFsxXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0
dXJlcyAiY21kX2Jvb3RzdGFnZSIgbm90IGVuYWJsZWQKU0tJUFBFRCBbMV0gdGVzdC9weS9j
b25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImJvb3RzdGFnZV9zdGFzaCIgbm90
IGVuYWJsZWQKU0tJUFBFRCBbMV0gdGVzdC9weS90ZXN0cy90ZXN0X2RmdS5weToxMTQ6IGdv
dCBlbXB0eSBwYXJhbWV0ZXIgc2V0IGZvciAoZW52X191c2JfZGV2X3BvcnQpClNLSVBQRUQg
WzJdIHRlc3QvcHkvY29uZnRlc3QucHk6NzIxOiAuY29uZmlnIGZlYXR1cmVzICJjbWRfZWZp
ZGVidWciIG5vdCBlbmFibGVkClNLSVBQRUQgWzFdIHRlc3QvcHkvY29uZnRlc3QucHk6NzIx
OiAuY29uZmlnIGZlYXR1cmVzICJjbWRfd2dldCIgbm90IGVuYWJsZWQKU0tJUFBFRCBbMV0g
dGVzdC9weS90ZXN0cy90ZXN0X2VmaV9sb2FkZXIucHk6MTMzOiBObyBlbnZfX2VmaV9sb2Fk
ZXJfZ3J1Yl9maWxlIGJpbmFyeSBzcGVjaWZpZWQgaW4gZW52aXJvbm1lbnQKU0tJUFBFRCBb
MV0gdGVzdC9weS9jb25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImVmaV90Y2cy
X3Byb3RvY29sIiBub3QgZW5hYmxlZApTS0lQUEVEIFsxXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5
OjcyMTogLmNvbmZpZyBmZWF0dXJlcyAiY21kX252ZWRpdF9pbmZvIiBub3QgZW5hYmxlZApT
S0lQUEVEIFsyXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0dXJlcyAi
Zml0X3NpZ25hdHVyZSIgbm90IGVuYWJsZWQKU0tJUFBFRCBbMTNdIHRlc3QvcHkvY29uZnRl
c3QucHk6NzIxOiAuY29uZmlnIGZlYXR1cmVzICJjbWRfZnBnYSIgbm90IGVuYWJsZWQKU0tJ
UFBFRCBbMV0gdGVzdC9weS9jb25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImNt
ZF9mcGdhX2xvYWRwIiBub3QgZW5hYmxlZApTS0lQUEVEIFsxXSB0ZXN0L3B5L2NvbmZ0ZXN0
LnB5OjcyMTogLmNvbmZpZyBmZWF0dXJlcyAiY21kX2ZwZ2FfbG9hZGJwIiBub3QgZW5hYmxl
ZApTS0lQUEVEIFsxMV0gdGVzdC9weS9jb25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVy
ZXMgImNtZF9mcGdhX2xvYWRtayIgbm90IGVuYWJsZWQKU0tJUFBFRCBbMl0gdGVzdC9weS9j
b25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImNtZF9mcGdhX2xvYWRfc2VjdXJl
IiBub3QgZW5hYmxlZApTS0lQUEVEIFsyXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNv
bmZpZyBmZWF0dXJlcyAiY21kX2Jsb2JsaXN0IiBub3QgZW5hYmxlZApTS0lQUEVEIFs3XSB0
ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0dXJlcyAiY21kX2dwaW8iIG5v
dCBlbmFibGVkClNLSVBQRUQgWzJdIHRlc3QvcHkvY29uZnRlc3QucHk6NzIxOiAuY29uZmln
IGZlYXR1cmVzICJjbWRfZ3B0X3JlbmFtZSIgbm90IGVuYWJsZWQKU0tJUFBFRCBbNV0gdGVz
dC9weS9jb25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImNtZF9pMmMiIG5vdCBl
bmFibGVkClNLSVBQRUQgWzFdIHRlc3QvcHkvY29uZnRlc3QucHk6NzIxOiAuY29uZmlnIGZl
YXR1cmVzICJjbWRfbG9nIiBub3QgZW5hYmxlZApTS0lQUEVEIFszXSB0ZXN0L3B5L2NvbmZ0
ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0dXJlcyAicGh5bGliIiBub3QgZW5hYmxlZApTS0lQ
UEVEIFsyXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0dXJlcyAiY21k
X21lbXRlc3QiIG5vdCBlbmFibGVkClNLSVBQRUQgWzZdIHRlc3QvcHkvY29uZnRlc3QucHk6
NzIxOiAuY29uZmlnIGZlYXR1cmVzICJjbWRfbWlpIiBub3QgZW5hYmxlZApTS0lQUEVEIFsy
XSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0dXJlcyAiZXh0NF93cml0
ZSIgbm90IGVuYWJsZWQKU0tJUFBFRCBbMV0gdGVzdC9weS90ZXN0cy90ZXN0X21tY19yZC5w
eToxMzQ6IGdvdCBlbXB0eSBwYXJhbWV0ZXIgc2V0IGZvciAoZW52X19tbWNfZGV2X2NvbmZp
ZykKU0tJUFBFRCBbMV0gdGVzdC9weS90ZXN0cy90ZXN0X21tY19yZC5weToxNTU6IGdvdCBl
bXB0eSBwYXJhbWV0ZXIgc2V0IGZvciAoZW52X19tbWNfZGV2X2NvbmZpZykKU0tJUFBFRCBb
MV0gdGVzdC9weS90ZXN0cy90ZXN0X21tY19yZC5weToxODE6IGdvdCBlbXB0eSBwYXJhbWV0
ZXIgc2V0IGZvciAoZW52X19tbWNfZGV2X2NvbmZpZykKU0tJUFBFRCBbMV0gdGVzdC9weS90
ZXN0cy90ZXN0X21tY19yZC5weToyMTg6IGdvdCBlbXB0eSBwYXJhbWV0ZXIgc2V0IGZvciAo
ZW52X19tbWNfcmRfY29uZmlnKQpTS0lQUEVEIFsxXSB0ZXN0L3B5L3Rlc3RzL3Rlc3RfbW1j
X3dyLnB5OjM4OiBnb3QgZW1wdHkgcGFyYW1ldGVyIHNldCBmb3IgKGVudl9fbW1jX3dyX2Nv
bmZpZykKU0tJUFBFRCBbMV0gdGVzdC9weS9jb25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVh
dHVyZXMgImNtZF9kaGNwNiIgbm90IGVuYWJsZWQKU0tJUFBFRCBbMl0gdGVzdC9weS90ZXN0
cy90ZXN0X25ldC5weToyMTQ6IE5vIHN0YXRpYyBuZXR3b3JrIGNvbmZpZ3VyYXRpb24gaXMg
ZGVmaW5lZApTS0lQUEVEIFsxXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBm
ZWF0dXJlcyAiSVBWNl9ST1VURVJfRElTQ09WRVJZIiBub3QgZW5hYmxlZApTS0lQUEVEIFsx
XSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0dXJlcyAiY21kX25mcyIg
bm90IGVuYWJsZWQKU0tJUFBFRCBbMV0gdGVzdC9weS9jb25mdGVzdC5weTo3MjE6IC5jb25m
aWcgZmVhdHVyZXMgImNtZF90ZnRwcHV0IiBub3QgZW5hYmxlZApTS0lQUEVEIFsxXSB0ZXN0
L3B5L3Rlc3RzL3Rlc3RfbmV0X2Jvb3QucHk6MTk2OiBURlRQIGJvb3QgdGVzdCBpcyBub3Qg
ZW5hYmxlZCEKU0tJUFBFRCBbMV0gdGVzdC9weS90ZXN0cy90ZXN0X25ldF9ib290LnB5OjI1
MjogUFhFIGJvb3QgdGVzdCBpcyBub3QgZW5hYmxlZCEKU0tJUFBFRCBbMV0gdGVzdC9weS90
ZXN0cy90ZXN0X25ldF9ib290LnB5OjMwMzogUFhFIGJvb3QgdGVzdCBpcyBub3QgZW5hYmxl
ZCEKU0tJUFBFRCBbMV0gdGVzdC9weS90ZXN0cy90ZXN0X25ldF9ib290LnB5OjM4MjogUFhF
IGJvb3QgdGVzdCBpcyBub3QgZW5hYmxlZCEKU0tJUFBFRCBbMV0gdGVzdC9weS9jb25mdGVz
dC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImNtZF9vcHRlZV9ycG1iIiBub3QgZW5hYmxl
ZApTS0lQUEVEIFszXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0dXJl
cyAiY21kX3Bpbm11eCIgbm90IGVuYWJsZWQKU0tJUFBFRCBbM10gdGVzdC9weS9jb25mdGVz
dC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImNtZF9wc3RvcmUiIG5vdCBlbmFibGVkClNL
SVBQRUQgWzJdIHRlc3QvcHkvY29uZnRlc3QucHk6NzIxOiAuY29uZmlnIGZlYXR1cmVzICJj
bWRfcWZ3IiBub3QgZW5hYmxlZApTS0lQUEVEIFsyXSB0ZXN0L3B5L3Rlc3RzL3Rlc3RfcmVz
ZXQucHk6Mzc6IGJvb3Rtb2RlIGNhbm5vdCBiZSBkZXRlcm1pbmVkClNLSVBQRUQgWzFdIHRl
c3QvcHkvdGVzdHMvdGVzdF9zYXZlZW52LnB5OjQxOiBib290bW9kZSBjYW5ub3QgYmUgZGV0
ZXJtaW5lZApTS0lQUEVEIFsxXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBm
ZWF0dXJlcyAiY21kX3NjcDAzIiBub3QgZW5hYmxlZApTS0lQUEVEIFs0XSB0ZXN0L3B5L3Rl
c3RzL3Rlc3Rfc2NzaS5weToyNTogTm8gU0NTSSBkZXZpY2UgdG8gdGVzdApTS0lQUEVEIFsx
XSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0dXJlcyAic2VtaWhvc3Rp
bmciIG5vdCBlbmFibGVkClNLSVBQRUQgWzFdIHRlc3QvcHkvdGVzdHMvdGVzdF9zZi5weTox
Njc6IGdvdCBlbXB0eSBwYXJhbWV0ZXIgc2V0IGZvciAoZW52X19zZl9jb25maWcpClNLSVBQ
RUQgWzFdIHRlc3QvcHkvdGVzdHMvdGVzdF9zZi5weToxNzQ6IGdvdCBlbXB0eSBwYXJhbWV0
ZXIgc2V0IGZvciAoZW52X19zZl9jb25maWcpClNLSVBQRUQgWzFdIHRlc3QvcHkvdGVzdHMv
dGVzdF9zZi5weToxODY6IGdvdCBlbXB0eSBwYXJhbWV0ZXIgc2V0IGZvciAoZW52X19zZl9j
b25maWcpClNLSVBQRUQgWzFdIHRlc3QvcHkvdGVzdHMvdGVzdF9zZi5weToyMDk6IGdvdCBl
bXB0eSBwYXJhbWV0ZXIgc2V0IGZvciAoZW52X19zZl9jb25maWcpClNLSVBQRUQgWzFdIHRl
c3QvcHkvY29uZnRlc3QucHk6NzIxOiAuY29uZmlnIGZlYXR1cmVzICJjbWRfc21iaW9zIiBu
b3QgZW5hYmxlZApTS0lQUEVEIFsxXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZp
ZyBmZWF0dXJlcyAicWZ3X3NtYmlvcyIgbm90IGVuYWJsZWQKU0tJUFBFRCBbMl0gdGVzdC9w
eS9jb25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgInNhbmRib3giIG5vdCBlbmFi
bGVkClNLSVBQRUQgWzFdIHRlc3QvcHkvY29uZnRlc3QucHk6NzIxOiAuY29uZmlnIGZlYXR1
cmVzICJnZW5lcmF0ZV9zbWJpb3NfdGFibGVfdmVyYm9zZSIgbm90IGVuYWJsZWQKU0tJUFBF
RCBbN10gdGVzdC9weS9jb25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImNtZF9z
ZiIgbm90IGVuYWJsZWQKU0tJUFBFRCBbMV0gdGVzdC9weS9jb25mdGVzdC5weTo3MjE6IC5j
b25maWcgZmVhdHVyZXMgInNwbF91bml0X3Rlc3QiIG5vdCBlbmFibGVkClNLSVBQRUQgWzFd
IHRlc3QvcHkvdGVzdHMvdGVzdF9zcGwucHk6IGdvdCBlbXB0eSBwYXJhbWV0ZXIgc2V0IGZv
ciAodXRfc3BsX3N1YnRlc3QpClNLSVBQRUQgWzFdIHRlc3QvcHkvY29uZnRlc3QucHk6NzIx
OiAuY29uZmlnIGZlYXR1cmVzICJjbWRfc3RhY2twcm90ZWN0b3JfdGVzdCIgbm90IGVuYWJs
ZWQKU0tJUFBFRCBbOV0gdGVzdC9weS9jb25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVy
ZXMgImNtZF90cG1fdjIiIG5vdCBlbmFibGVkClNLSVBQRUQgWzFdIHRlc3QvcHkvdGVzdHMv
dGVzdF91bXMucHk6NzY6IGdvdCBlbXB0eSBwYXJhbWV0ZXIgc2V0IGZvciAoZW52X191c2Jf
ZGV2X3BvcnQpClNLSVBQRUQgWzE0XSB0ZXN0L3B5L3Rlc3RzL3Rlc3RfdXNiLnB5OjI1OiBV
U0IgZGV2aWNlIHRlc3QgaXMgbm90IGVuYWJsZWQKU0tJUFBFRCBbM10gdGVzdC9weS9jb25m
dGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImNtZF9leHQ0X3dyaXRlIiBub3QgZW5h
YmxlZApTS0lQUEVEIFsxXSB0ZXN0L3B5L2NvbmZ0ZXN0LnB5OjcyMTogLmNvbmZpZyBmZWF0
dXJlcyAidXRfZG0iIG5vdCBlbmFibGVkClNLSVBQRUQgWzFdIHRlc3QvcHkvdGVzdHMvdGVz
dF91dC5weTo2NjU6IFRlc3QgY29tbW9uIHRlc3RfZXZlbnRfcHJvYmUgaGFzIDEgc2tpcHBl
ZCBzdWItdGVzdChzKS4KU0tJUFBFRCBbMV0gdGVzdC9weS90ZXN0cy90ZXN0X3V0LnB5OjY2
NTogVGVzdCBmZHQgZmR0X3Rlc3RfYXBwbHkgaGFzIDEgc2tpcHBlZCBzdWItdGVzdChzKS4K
U0tJUFBFRCBbMV0gdGVzdC9weS90ZXN0cy90ZXN0X3ZwbC5weTogZ290IGVtcHR5IHBhcmFt
ZXRlciBzZXQgZm9yICh1dF92cGxfc3VidGVzdCkKU0tJUFBFRCBbM10gdGVzdC9weS9jb25m
dGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImNtZF96eW5xX2FlcyIgbm90IGVuYWJs
ZWQKU0tJUFBFRCBbMl0gdGVzdC9weS9jb25mdGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVy
ZXMgImNtZF96eW5xX3JzYSIgbm90IGVuYWJsZWQKU0tJUFBFRCBbNV0gdGVzdC9weS9jb25m
dGVzdC5weTo3MjE6IC5jb25maWcgZmVhdHVyZXMgImNtZF96eW5xbXAiIG5vdCBlbmFibGVk
CkZBSUxFRCB0ZXN0L3B5L3Rlc3RzL3Rlc3RfdXQucHk6OnRlc3RfdXRbdXRfY21kX2NtZF90
ZXN0X3BhcnRfbnVtYmVyXSAtIGFzc2VydCBGYWxzZQogKyAgd2hlcmUgRmFsc2UgPSA8YnVp
bHQtaW4gbWV0aG9kIGVuZHN3aXRoIG9mIHN0ciBvYmplY3QgYXQgMHhmZmZmNGQ5MzhiNzA+
KCdmYWlsdXJlczogMCcpCiArICAgIHdoZXJlIDxidWlsdC1pbiBtZXRob2QgZW5kc3dpdGgg
b2Ygc3RyIG9iamVjdCBhdCAweGZmZmY0ZDkzOGI3MD4gPSAnVGVzdDogcGFydF9udW1iZXI6
IHBhcnQuY1xyXHJcbnRlc3QvY21kL3BhcnQuYzo0Niwgc2V0dXBfZ3B0X3BhcnRpdGlvbnMo
KTogbW1jX2Rldl9udW0gPT0gYmxrX2dldF9kZXZpY2VfYnlfc3RyKCJtbWMiLi4ubWJlclwn
IGZhaWxlZCAyIHRpbWVzXHJcclxuVGVzdHMgcnVuOiAxLCAxIG1zLCBhdmVyYWdlOiAxIG1z
LCBmYWlsdXJlczogMlxyXHJcbmV4aXQgbm90IGFsbG93ZWQgZnJvbSBtYWluIGlucHV0IHNo
ZWxsLicuZW5kc3dpdGgKRkFJTEVEIHRlc3QvcHkvdGVzdHMvdGVzdF91dC5weTo6dGVzdF91
dFt1dF9jbWRfY21kX3Rlc3RfcGFydF9zaXplXSAtIGFzc2VydCBGYWxzZQogKyAgd2hlcmUg
RmFsc2UgPSA8YnVpbHQtaW4gbWV0aG9kIGVuZHN3aXRoIG9mIHN0ciBvYmplY3QgYXQgMHhm
ZmZmNGUyNzdkZDA+KCdmYWlsdXJlczogMCcpCiArICAgIHdoZXJlIDxidWlsdC1pbiBtZXRo
b2QgZW5kc3dpdGggb2Ygc3RyIG9iamVjdCBhdCAweGZmZmY0ZTI3N2RkMD4gPSAnVGVzdDog
cGFydF9zaXplOiBwYXJ0LmNcclxyXG50ZXN0L2NtZC9wYXJ0LmM6NDYsIHNldHVwX2dwdF9w
YXJ0aXRpb25zKCk6IG1tY19kZXZfbnVtID09IGJsa19nZXRfZGV2aWNlX2J5X3N0cigibW1j
IiwgLi4uc2l6ZVwnIGZhaWxlZCAyIHRpbWVzXHJcclxuVGVzdHMgcnVuOiAxLCAxIG1zLCBh
dmVyYWdlOiAxIG1zLCBmYWlsdXJlczogMlxyXHJcbmV4aXQgbm90IGFsbG93ZWQgZnJvbSBt
YWluIGlucHV0IHNoZWxsLicuZW5kc3dpdGgKRkFJTEVEIHRlc3QvcHkvdGVzdHMvdGVzdF91
dC5weTo6dGVzdF91dFt1dF9jbWRfY21kX3Rlc3RfcGFydF9zdGFydF0gLSBhc3NlcnQgRmFs
c2UKICsgIHdoZXJlIEZhbHNlID0gPGJ1aWx0LWluIG1ldGhvZCBlbmRzd2l0aCBvZiBzdHIg
b2JqZWN0IGF0IDB4ZmZmZjRkOTM5MmYwPignZmFpbHVyZXM6IDAnKQogKyAgICB3aGVyZSA8
YnVpbHQtaW4gbWV0aG9kIGVuZHN3aXRoIG9mIHN0ciBvYmplY3QgYXQgMHhmZmZmNGQ5Mzky
ZjA+ID0gJ1Rlc3Q6IHBhcnRfc3RhcnQ6IHBhcnQuY1xyXHJcbnRlc3QvY21kL3BhcnQuYzo0
Niwgc2V0dXBfZ3B0X3BhcnRpdGlvbnMoKTogbW1jX2Rldl9udW0gPT0gYmxrX2dldF9kZXZp
Y2VfYnlfc3RyKCJtbWMiLC4uLnRhcnRcJyBmYWlsZWQgMiB0aW1lc1xyXHJcblRlc3RzIHJ1
bjogMSwgMiBtcywgYXZlcmFnZTogMiBtcywgZmFpbHVyZXM6IDJcclxyXG5leGl0IG5vdCBh
bGxvd2VkIGZyb20gbWFpbiBpbnB1dCBzaGVsbC4nLmVuZHN3aXRoCj09PT09PT09PT0gMyBm
YWlsZWQsIDIyMCBwYXNzZWQsIDU3MiBza2lwcGVkLCAyIGRlc2VsZWN0ZWQgaW4gMzIuMzdz
ID09PT09PT09PT09Cit1LWJvb3QtdGVzdC1yZWxlYXNlIHFlbXUtcmlzY3YzMiBuYQpzZWN0
aW9uX2VuZDoxNzc3NDUwOTIyOnN0ZXBfc2NyaXB0ChtbMEtzZWN0aW9uX3N0YXJ0OjE3Nzc0
NTA5MjI6YWZ0ZXJfc2NyaXB0ChtbMEsbWzBLG1szNjsxbVJ1bm5pbmcgYWZ0ZXJfc2NyaXB0
G1swO20bWzA7bQobWzMyOzFtUnVubmluZyBhZnRlciBzY3JpcHQuLi4bWzA7bQobWzMyOzFt
JCBjcCAtdiAvdG1wLyR7VEVTVF9QWV9CRH0vKi57aHRtbCxjc3MseG1sfSAuG1swO20KY3A6
IGNhbm5vdCBzdGF0ICcvdG1wL3FlbXUtcmlzY3YzMi8qLmh0bWwnOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5CmNwOiBjYW5ub3Qgc3RhdCAnL3RtcC9xZW11LXJpc2N2MzIvKi5jc3Mn
OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CmNwOiBjYW5ub3Qgc3RhdCAnL3RtcC9xZW11
LXJpc2N2MzIvKi54bWwnOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CnNlY3Rpb25fZW5k
OjE3Nzc0NTA5MjI6YWZ0ZXJfc2NyaXB0ChtbMEsbWzA7MzNtV0FSTklORzogYWZ0ZXJfc2Ny
aXB0IGZhaWxlZCwgYnV0IGpvYiB3aWxsIGNvbnRpbnVlIHVuYWZmZWN0ZWQ6IGV4aXQgY29k
ZSAxG1swO20Kc2VjdGlvbl9zdGFydDoxNzc3NDUwOTIyOnVwbG9hZF9hcnRpZmFjdHNfb25f
ZmFpbHVyZQobWzBLG1swSxtbMzY7MW1VcGxvYWRpbmcgYXJ0aWZhY3RzIGZvciBmYWlsZWQg
am9iG1swO20bWzA7bQobWzMyOzFtVXBsb2FkaW5nIGFydGlmYWN0cy4uLhtbMDttChtbMDsz
M21XQVJOSU5HOiAqLmh0bWw6IG5vIG1hdGNoaW5nIGZpbGVzLiBFbnN1cmUgdGhhdCB0aGUg
YXJ0aWZhY3QgcGF0aCBpcyByZWxhdGl2ZSB0byB0aGUgd29ya2luZyBkaXJlY3RvcnkgKC9i
dWlsZHMvdS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0bSkbWzA7bSAKG1swOzMzbVdBUk5J
Tkc6ICouY3NzOiBubyBtYXRjaGluZyBmaWxlcy4gRW5zdXJlIHRoYXQgdGhlIGFydGlmYWN0
IHBhdGggaXMgcmVsYXRpdmUgdG8gdGhlIHdvcmtpbmcgZGlyZWN0b3J5ICgvYnVpbGRzL3Ut
Ym9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0pG1swO20gChtbMDszM21XQVJOSU5HOiByZXN1
bHRzLnhtbDogbm8gbWF0Y2hpbmcgZmlsZXMuIEVuc3VyZSB0aGF0IHRoZSBhcnRpZmFjdCBw
YXRoIGlzIHJlbGF0aXZlIHRvIHRoZSB3b3JraW5nIGRpcmVjdG9yeSAoL2J1aWxkcy91LWJv
b3QvY3VzdG9kaWFucy91LWJvb3Qtc3RtKRtbMDttIAobWzMxOzFtRVJST1I6IE5vIGZpbGVz
IHRvIHVwbG9hZCAgICAgICAgICAgICAgICAgICAgICAgICAbWzA7bSAKG1szMjsxbVVwbG9h
ZGluZyBhcnRpZmFjdHMuLi4bWzA7bQobWzA7MzNtV0FSTklORzogcmVzdWx0cy54bWw6IG5v
IG1hdGNoaW5nIGZpbGVzLiBFbnN1cmUgdGhhdCB0aGUgYXJ0aWZhY3QgcGF0aCBpcyByZWxh
dGl2ZSB0byB0aGUgd29ya2luZyBkaXJlY3RvcnkgKC9idWlsZHMvdS1ib290L2N1c3RvZGlh
bnMvdS1ib290LXN0bSkbWzA7bSAKG1szMTsxbUVSUk9SOiBObyBmaWxlcyB0byB1cGxvYWQg
ICAgICAgICAgICAgICAgICAgICAgICAgG1swO20gCnNlY3Rpb25fZW5kOjE3Nzc0NTA5MjI6
dXBsb2FkX2FydGlmYWN0c19vbl9mYWlsdXJlChtbMEtzZWN0aW9uX3N0YXJ0OjE3Nzc0NTA5
MjI6Y2xlYW51cF9maWxlX3ZhcmlhYmxlcwobWzBLG1swSxtbMzY7MW1DbGVhbmluZyB1cCBw
cm9qZWN0IGRpcmVjdG9yeSBhbmQgZmlsZSBiYXNlZCB2YXJpYWJsZXMbWzA7bRtbMDttCnNl
Y3Rpb25fZW5kOjE3Nzc0NTA5MjI6Y2xlYW51cF9maWxlX3ZhcmlhYmxlcwobWzBLG1szMTsx
bUVSUk9SOiBKb2IgZmFpbGVkOiBleGl0IGNvZGUgMQobWzA7bQo=

--------------TPMb7oNy1YR2UORoy5WUSvX3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--------------TPMb7oNy1YR2UORoy5WUSvX3--
