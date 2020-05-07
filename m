Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 439BC1C82A2
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 May 2020 08:39:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4733C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 May 2020 06:39:46 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90F21C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 06:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuLKcRl/ir2anf1yEyhg8BcLwm+tsTIf6n4uqzFUlAZFYBwjWtcwBM1aIexZdPwumCQn5vbcXgtnswBExbt5/gbvVRMZ+fe1FBzWeoLNR5rUO9XZoc3XaX3HUQrIPavYKYK57Endp6TrGs6mOKVz7FMhd94FQtUiQU4+Yj7S5VS6AAtCRVJ2hDnv8OrkyoRGjcmAbhWX9n7707ITCayAWqyiQ5SXxhMPtJPlmLB4QO1eRlp6xseWta35zbgqrKZynwSOJ/KI9aNXeYAcKozLO3grqpj70N0jp9ab7AqKMtwpZ2w9OPMh+uN0F4dxfURvmeR2rE5mwHLRIHNXTyK0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEVAhLPx6+697ak2Upqx9qNfeyGoBGsVlrBaNFJLBkY=;
 b=d9NTN7onoqQy6076aqN6LkAEfQvvN6dnHHxkxFJFgWajzUhvma/fMpme+IcLcnFp7vfsiJrKbQ8fbW8JZgCfH+vt3AYNobGt9lQqnOL4zNSN14d1hjriETIudPrHDkiT8SV1LH3sVn8/oI/d5QpB31QWOLt1ScLnnqYQHDb96cYT3YSgWSpRpnTq1nvmsfDhvtERU0LH2iUofEoudf3QwTm9WfSwbAHqnRsgA8bB+rWdv+H9eczyCjG/wvYKwLy0qfOhRKj84+6/XewE/RiFNobqxBlbrNnsSMKJyxucJatm831duRvnJhJhXB6I8jz1psgSPUykQ8w14oVGwMi5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=denx.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEVAhLPx6+697ak2Upqx9qNfeyGoBGsVlrBaNFJLBkY=;
 b=ILoUVrZKe5lLhe5G9HWakY9s7iMLpYjII4pHesAso6tNC28alALHSebdxRKfUYEGf4qQ0ylMh0+gr95EhzmZsckK2A1B/Npb1lKE3ZymoksZVXVnxv8NWxeOqrKcm4M4ILepxK4EtK17dFx3HNDwYRGyLw3htKIVsWPihr/6Yrc=
Received: from SN4PR0601CA0022.namprd06.prod.outlook.com
 (2603:10b6:803:2f::32) by BYAPR02MB3928.namprd02.prod.outlook.com
 (2603:10b6:a02:ef::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Thu, 7 May
 2020 06:39:41 +0000
Received: from SN1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2f:cafe::77) by SN4PR0601CA0022.outlook.office365.com
 (2603:10b6:803:2f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Thu, 7 May 2020 06:39:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT050.mail.protection.outlook.com (10.152.72.128) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Thu, 7 May 2020 06:39:39
 +0000
Received: from [149.199.38.66] (port=54144 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jWaBu-0003kD-7l; Wed, 06 May 2020 23:39:30 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jWaC3-0000P8-EL; Wed, 06 May 2020 23:39:39 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 0476dT0p029157; 
 Wed, 6 May 2020 23:39:29 -0700
Received: from [172.30.17.109] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jWaBt-0000GV-5R; Wed, 06 May 2020 23:39:29 -0700
To: hs@denx.de, Michal Simek <michal.simek@xilinx.com>, git@xilinx.com
References: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
 <e519e51b-d05e-949e-343c-3cb4e606d3c4@denx.de>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <637580f3-0042-ded2-173b-c9bddd92c588@xilinx.com>
Date: Thu, 7 May 2020 08:39:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e519e51b-d05e-949e-343c-3cb4e606d3c4@denx.de>
Content-Language: en-US
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(396003)(136003)(39860400002)(46966005)(33430700001)(70206006)(81166007)(7416002)(70586007)(26005)(186003)(7406005)(2906002)(36756003)(6666004)(33440700001)(82310400002)(8936002)(9786002)(8676002)(5660300002)(31696002)(4326008)(44832011)(6636002)(478600001)(356005)(316002)(54906003)(47076004)(82740400003)(31686004)(336012)(426003)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28c24d03-3e09-460f-926d-08d7f2516b1a
X-MS-TrafficTypeDiagnostic: BYAPR02MB3928:
X-Microsoft-Antispam-PRVS: <BYAPR02MB3928104766BFB701DE4203CBC6A50@BYAPR02MB3928.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYJXJfpOfTlSOq7MlUorKw1u/VKnF8miZ2Tpu0SUFaTTNFeGHH+3vUhSdNJs+7YoiRAVjD7JhbGMDBR3Oc0j3fjWfk2yuOMmPEjkPFy2MNAZSw5KI2eqRfpMonGXcxMiSBQra76q9iaSlXSQtXIovKAhCSAFp3BrWOzUFcO0zXcd6GCn2Nimg4dKtkFcY7HIn4hzvC3nPq6XE4ufrwH0pDAcWStmWUbMNyeRZ5Z2yunOBbhKR5xq2YK+6/mosK2DQbuYN2Ljm2Dap11qK6Y8u5rWflqPkxlISbiQr7hJLjnjnZXRETPfIE25IDsfrB2gY69W3ebw3x7xuRs0mGfEH6scS5BaullzcMxJ5dZJxGBzd+ksTAAj3iXmflaXR5jChLytlZc8VqD7PaYHmLCpWnBM+/n0GwmO7zJmcFSWNaBQKhqVI8I9t9ftWrwjuMJoQFGVzIEC2zCTmcmYYfJuJ5nD8KFKe9QTVIP5v2UfS1V65Py9gIbynW3q48m8c+kK+Niy0GE41eBu/vq+A2OTACWk8jTy9/kxOwftv/yFoH+Kw9VoU6AH7cIm23UG1ILlAwqXJUrPCZ1cHVKAjy2iGoLTEY6/oCxYWPHAM7KdlpU=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 06:39:39.8791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c24d03-3e09-460f-926d-08d7f2516b1a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB3928
Cc: Joel Johnson <mrjoel@lixil.net>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?Q?Eric_B=c3=a9nard?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ian Ray <ian.ray@ge.com>,
 Thomas Hebb <tommyhebb@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Anatolij Gustschin <agust@denx.de>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Tetsuyuki Kobayashi <koba@kmckk.co.jp>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Otavio Salvador <otavio@ossystems.com.br>, Thomas Weber <weber@corscience.de>,
 Tim Harvey <tharvey@gateworks.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
 Akshay Bhat <akshaybhat@timesys.com>, Adam Ford <aford173@gmail.com>,
 Ludwig Zenz <lzenz@dh-electronics.de>, Andreas Dannenberg <dannenberg@ti.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>, Holger Brunck <holger.brunck@ch.abb.com>,
 Mario Six <mario.six@gdsys.cc>,
 Masakazu Mochizuki <masakazu.mochizuki.wd@hitachi.com>
Subject: Re: [Uboot-stm32] [PATCH] cmd: mem: Remove
	CONFIG_SYS_MEMTEST_SCRATCH mapping
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gMDcuIDA1LiAyMCA1OjMzLCBIZWlrbyBTY2hvY2hlciB3cm90ZToKPiBIZWxsbyBNaWNoYWws
Cj4gCj4gQW0gMDQuMDUuMjAyMCB1bSAxMzo1NCBzY2hyaWViIE1pY2hhbCBTaW1lazoKPj4gVGhl
cmUgaXMgbm8gcmVhbCBuZWVkIHRvIGV4YWN0bHkgZGVmaW5lIHNwYWNlIGZvciBzYXZpbmcgcGF0
dGVybnMgZm9yCj4+IGFsdGVybmF0ZSBtZW1vcnkgdGVzdC4gSXQgaXMgbXVjaCBlYXNpZXIgdG8g
YWxsb2NhdGUgc3BhY2Ugb24gdGhlCj4+IHN0YWNrIGFuZAo+PiB1c2UgaXQgaW5zdGVhZCBvZiB0
cnlpbmcgdG8gZmluZCBvdXQgc3BhY2Ugd2hlcmUgcGF0dGVybiBzaG91bGQgYmUgc2F2ZWQuCj4+
Cj4+IEZvciBleGFtcGxlIGlmIHlvdSB3YW50IHRvIHRlc3QgdGhlIHdob2xlIEREUiBtZW1vcnkg
eW91IGNhbid0IHNhdmUKPj4gcGF0dGVyCj4+IHRvIEREUiBhbmQgeW91IG5lZWQgdG8gZmluZCBp
dCBvdXQuIE9uIFhpbGlueCBkZXZpY2VzIEREUiBvciBPQ00KPj4gYWRkcmVzc2VzCj4+IHdlcmUg
Y2hvc2VuIGJ1dCB0aGF0IG1lYW5zIHRoYXQgT0NNIG5lZWRzIHRvIGJlIG1hcHBlZCBhbmQgVS1C
b290IGhhcwo+PiBhY2Nlc3MgcGVybWlzc2lvbiB0aGVyZS4KPj4KPj4gSXQgaXMgZWFzaWVyIHRv
IHJlbW92ZSB0aGlzIGxpbWl0YXRpb24gYW5kIHNpbXBseSBzYXZlIGl0IG9uIHN0YWNrCj4+IGJl
Y2F1c2UKPj4gaXQgaXMgdmVyeSBjbGVhciB0aGF0IG1lbW9yeSB0ZXN0IGNhbid0IHJld3JpdGUg
VS1Cb290IGFuZCBVLUJvb3QgaGFzCj4+IGFsc28KPj4gZnVsbCBhY2Nlc3MgdG8gbWVtb3J5IHdo
ZXJlIHJ1bnMgZnJvbS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFNpbWVrIDxtaWNoYWwu
c2ltZWtAeGlsaW54LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIFJFQURNRcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQgLS0tLQo+PiDC
oCBjbWQvbWVtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCA5ICsrLS0tLS0tLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3MvTWlnb1IuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy9hZHZhbnRl
Y2hfZG1zLWJhMTYuaCB8IDEgLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3MvYXBhbGlzX2lteDYuaMKg
wqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy9hcmlzdGFpbmV0b3MyLmjC
oMKgwqDCoMKgIHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy9hcm1hZGlsbG8tODAwZXZhLmjC
oMKgIHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy9ibGFuY2hlLmjCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy9jZ3RxbXg2ZXZhbC5owqDCoMKgwqDC
oMKgwqAgfCAxIC0KPj4gwqAgaW5jbHVkZS9jb25maWdzL2NvbGlicmlfaW14Ni5owqDCoMKgwqDC
oMKgIHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy9kaF9pbXg2LmjCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy9lbDZ4X2NvbW1vbi5owqDCoMKgwqDC
oMKgwqAgfCAxIC0KPj4gwqAgaW5jbHVkZS9jb25maWdzL2VtYmVzdG14NmJvYXJkcy5owqDCoMKg
IHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy9nZV9ieDUwdjMuaMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDEgLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3MvZ3dfdmVudGFuYS5owqDCoMKgwqDCoMKgwqDC
oCB8IDEgLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3MvaW14Nl9sb2dpYy5owqDCoMKgwqDCoMKgwqDC
oCB8IDEgLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3Mva3ptOWcuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy9teDZzYWJyZV9jb21tb24uaMKgwqDC
oCB8IDEgLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3Mvbml0cm9nZW42eC5owqDCoMKgwqDCoMKgwqDC
oCB8IDEgLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3MvcHJlc2lkaW9fYXNpYy5owqDCoMKgwqDCoCB8
IDEgLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3Mvc2g3NzUyZXZiLmjCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxIC0KPj4gwqAgaW5jbHVkZS9jb25maWdzL3NoNzc1M2V2Yi5owqDCoMKgwqDCoMKgwqDCoMKg
IHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy9zaDc3NTdsY3IuaMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDEgLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDEuaMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy90YW8zNTMwLmjCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMSAtCj4+IMKgIGluY2x1ZGUvY29uZmlncy90cmljb3JkZXIuaMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDEgLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3MveGlsaW54X3ZlcnNhbC5owqDCoMKg
wqDCoCB8IDEgLQo+PiDCoCBpbmNsdWRlL2NvbmZpZ3MveGlsaW54X3ZlcnNhbF9taW5pLmggfCAx
IC0KPj4gwqAgaW5jbHVkZS9jb25maWdzL3hpbGlueF96eW5xbXAuaMKgwqDCoMKgwqAgfCA0IC0t
LS0KPj4gwqAgaW5jbHVkZS9jb25maWdzL3hpbGlueF96eW5xbXBfbWluaS5oIHwgMSAtCj4+IMKg
IGluY2x1ZGUvY29uZmlncy94aWxpbnhfenlucW1wX3I1LmjCoMKgIHwgMSAtCj4+IMKgIHNjcmlw
dHMvY29uZmlnX3doaXRlbGlzdC50eHTCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIDMyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCj4gCj4gSG1tLi4g
SSB0aGluayB0aGlzIGlzIGZyb20gb2xkIHBvd2VycGMgdGltZXMsIGJ1dCBJIGRvIG5vdCBzZWUg
YQo+IHBvd2VycGMgYm9hcmQgaW4gdGhlIGxpc3QsIHNvIHRoaXMgbWFrZXMgc2Vuc2UuCgpBbmQg
d2FzIHRoZXJlIGFueSByZWFzb24gdG8gc2V0dXAgc3BlY2lmaWMgYWRkcmVzcyBvbiBQUEMgZm9y
IHNhdmluZwp0ZXN0IHBhdHRlcm4/CgpUaGFua3MsCk1pY2hhbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
