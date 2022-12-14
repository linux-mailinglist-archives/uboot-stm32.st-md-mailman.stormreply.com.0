Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B212464C8C6
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Dec 2022 13:15:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2DEAC65047;
	Wed, 14 Dec 2022 12:15:01 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D0F9C65047
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 12:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCNl2bvgO02rLlrBaW+ZL1y/0d79WCdQ8OC9DhL+rXUfIr/lHr021X8rtCfV060wrxC/jFrVIWofHfD/iI5U72l1rUVkWlTcHGLFZldt2i+fkp3F/7/jxvpb88Lh8krEquEDkSBFFUHi06dBRy0lW5E3wZlLpWtiCu62dWcx3PO7Xtb8lQGK9G9kVUJiNgBTrhIoYrL9kACk11skNbP9b5nqAcJurmN4yi3Jy6qHGEq46qd2SAQRAzbZnMBPv4cgQjkoTAAlParWbaa5EHQYDLHCkUKt34b7R0+B1lZKK1kPREOrBGV6mS+48unJeWA1eWhbmifcZX3o0nqZfxBCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Pgd1lXPgJtAr1pd8izSJ4Upq56FfoCYdRSMiyW7R/k=;
 b=P7aImxIa4tW6aNnpDV5udNNOEW8rkJx7C7OJmtl1KOVfP73YS5eOC9+/8nTJAlQzN2SJvVJ3sEIVAPk66ZCyEru92ZsXvei4jvgeqWvJE3rRbw59cJMBDNpmyr8XPXr6u6Q1XKTbh9Le7cfXmwksRnhe1qojc9i6FtYNeB6YJTG4ZQ0oFwdaJ+cg15jhCXRxWdAGZ11nGV93Xy65yF1juLOf9UyFpJFaKPv5o3ati8ihqqpgC/6Dd+tkMdKAwcdx/GYBwZ8GdxjeM4wqdFK9AsxpbGLTwq3HUlKwPwDQ78Y9KFPOmxSOwBx3GRbUXgE45D0iHcjiUQbYd3B0A+gohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=denx.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pgd1lXPgJtAr1pd8izSJ4Upq56FfoCYdRSMiyW7R/k=;
 b=PQfnWWOObcyBb4x+1Z72kJfc1W/9ZqP/tiA+z39H8Otn2yc7osxxCRdWeV3Ie8xvDYX63BTWjLyFmLh26kyZD0xlCN2nnWD3zYew6CxOAADN12N6QJzn2ie6a+aioUZwPwpPXQ/avk9AXyERQZY9+EJL4Vj0ADxH3a3pffsL/0w=
Received: from DM6PR17CA0030.namprd17.prod.outlook.com (2603:10b6:5:1b3::43)
 by DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 12:14:57 +0000
Received: from DS1PEPF0000E65A.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::48) by DM6PR17CA0030.outlook.office365.com
 (2603:10b6:5:1b3::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Wed, 14 Dec 2022 12:14:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E65A.mail.protection.outlook.com (10.167.18.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.8 via Frontend Transport; Wed, 14 Dec 2022 12:14:57 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 14 Dec
 2022 06:14:16 -0600
Message-ID: <1b42f733-fc5b-0380-2754-dbc8e649f852@amd.com>
Date: Wed, 14 Dec 2022 13:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
 <78cd07dc-3a80-2dbe-9295-4594520f84b8@denx.de>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <78cd07dc-3a80-2dbe-9295-4594520f84b8@denx.de>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E65A:EE_|DM4PR12MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ba5933-502a-47fd-a2d3-08daddccd112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tjp8R5c5lGgceKEIWt3Mhaet+zAVL0ypgII4ValMRmAoo9Scoioxk28Kev5oVwyc8YhO9xbLTs84AlJIyb5rJLCzoe8yITOmdIYpmb8cScm9CvhLpfTWwCzBLQe710yw/CPWvcveVjH6btMogyQlUv7ijcIJTHouoKrWE25ISHmWFQqrHV6LTHRanR+Z/8N9481VXbz3Zneof0/I+hRR2KHcxmSX9RYg4gNydxfaIQF7huoo8pmsJeOrB5vQImYYWL8Nzd2Ob0QfNP0nriuOrxcCJFKTPItgam2qAbeqK03plPyLRIq3+bCGMX08n36YGUC0Dpwyx6Vc/tKtOZpyzDjWfc7e9K8rCFAAuzymoc3iV7PUDoJVj1orCVYc2Xu3Ft3xT+HFx9sI4DtK4L3yqHsO7nyNNwdOwJNZz23H95/3ySf55+YHxZD6glt6l+PWeP8z4OqQmBq/wsQbpVf6w2EO3RadatAZSB7ADIbenJZ6UMHtlcnzpHDgB9LDMrg/Qk0ZucShYyfrRrX+aGl8YWr8N5fbDAbkF7Lt8/YBe6CjE/qxKUiz4M7zpJ0IYPrvekv5OULw5ygLeFdp7qzbVZikRk0pGfV9+nsYawh/2q1QTYMPJ9jetCh7RNgshCUp3JvUHD2NvXYKcW2EYNrCGWT3CJG42C/FTJcUUqQ14WDtBSXE5ZTWuibeJSWzt11k9Kr+/8pDheM6JziwfIjHKOY/JpGlF70lgDS8l11GXyhODNcuBJmpoO2FOgaHD/H5oHVK+io4znhhEU7z5TYzxQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(31686004)(2906002)(7416002)(40480700001)(5660300002)(36860700001)(40460700003)(8936002)(336012)(44832011)(82740400003)(83380400001)(86362001)(31696002)(2616005)(81166007)(356005)(426003)(47076005)(110136005)(316002)(16576012)(54906003)(478600001)(16526019)(107886003)(186003)(82310400005)(41300700001)(26005)(8676002)(4326008)(70206006)(53546011)(70586007)(43740500002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 12:14:57.5979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ba5933-502a-47fd-a2d3-08daddccd112
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E65A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5296
Cc: Tom Rini <trini@konsulko.com>, Thomas Huth <thuth@redhat.com>,
 Sean Anderson <sean.anderson@seco.com>, Simon Glass <sjg@chromium.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 0/3] Add support for USB onboard HUB,
	used on stm32 boards
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



On 12/12/22 14:19, Marek Vasut wrote:
> CAUTION: This message has originated from an External Source. Please use proper 
> judgment and caution when opening attachments, clicking links, or responding to 
> this email.
> 
> 
> On 12/12/22 11:44, Fabrice Gasnier wrote:
>> This series adds a driver to support USB onboard HUB, inspired by Linux
>> onboard hub driver.
>>
>> Purpose is to manage the power supply regulator on STM32 boards, for
>> low power use case in Linux. U-boot driver allows to benefit of the
>> device tree part to supply the HUB when need, instead using an
>> always-on regulator.
>>
>> It aligns the relevant DT part from emerging Linux v6.2. It also adds the
>> relevant default configuration on stm32mp15.

Not sure why v6.2 is relevant. That changes in connection to usb hubs/companion 
hubs/peer hubs have been merged some time ago.

It would be lovely to see also peer hubs part in u-boot too but nothing wrong 
with this part.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
