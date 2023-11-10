Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE127E7C7F
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 14:23:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3548EC6B47D;
	Fri, 10 Nov 2023 13:23:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CB07C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 13:23:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AA9h8rg021917; Fri, 10 Nov 2023 14:23:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=3KUB27Bz1eGzx7Y/YLLWNww3hYlM7BCaUo9MS2Sv/ic=; b=8O
 FPcAPlY8ZHDaOe0IOqIYp4RO+mMLb3XdGoZz1/sRQWNTrcI6y4uwpoguS7fyncD/
 ilqN6fW2+wvN54Pz1brokOn6ybhtRvBUiLtAM/E/ehPz1T+HDh4cFdraISSE07p0
 R1oaOVUaQe4RSpVeTScuJW/Bq3DEad/68pESyP1AKFOiZRFLIzLUzpxfTCrtn7bz
 R82gp7zeDmTdGnwKwSNSsyqy3mnzbr4zlquBBrHqQndkwqWcJ484oDVlnKUZiwSs
 tJfnIfPLEj0Wds1n61TG1DAvyhRXzKfshm3xJ+VxDNAsIiOpFHCWr98ygOXefLJQ
 4cu/ilFoxYL9o2bd0Rbg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u84a5n1s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 14:23:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 516F7100056;
 Fri, 10 Nov 2023 14:23:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4ABF325E53F;
 Fri, 10 Nov 2023 14:23:18 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 14:23:17 +0100
Message-ID: <c34d995a-ba72-4008-a38c-0e32c1f89e66@foss.st.com>
Date: Fri, 10 Nov 2023 14:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-7-patrice.chotard@foss.st.com>
 <ea3b3789-57ab-47d8-88d9-6aaab59c2b4d@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ea3b3789-57ab-47d8-88d9-6aaab59c2b4d@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_10,2023-11-09_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 6/9] serial: stm32: Fix AARCH64
	compilation warnings
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

CgpPbiAxMS85LzIzIDEwOjE1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEwLzI3LzIzIDE2OjQzLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEZyb206IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KPj4KPj4gV2hlbiBidWlsZGluZyB3aXRo
IEFBUkNINjQgZGVmY29uZmlnLCB3ZSBnb3Qgd2FybmluZ3MsIGZpeCB0aGVtCj4+IGJ5IHVzaW5n
IHJlZ2lzdGVycyBiYXNlIGFkZHJlc3MgZGVmaW5lZCBhcyB2b2lkIF9faW9tZW0gKiBpbnN0ZWFk
IG9mCj4+IGZkdF9hZGRyX3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8
cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJk
IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBkcml2ZXJzL3Nl
cmlhbC9zZXJpYWxfc3RtMzIuYyB8IDIzICsrKysrKysrKysrKystLS0tLS0tLS0tCj4+IMKgIGRy
aXZlcnMvc2VyaWFsL3NlcmlhbF9zdG0zMi5oIHzCoCAyICstCj4+IMKgIDIgZmlsZXMgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4gCj4gUmV2aWV3ZWQtYnk6
IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhh
bmtzCj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9uZXh0CgpUaGFua3MKUGF0
cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
