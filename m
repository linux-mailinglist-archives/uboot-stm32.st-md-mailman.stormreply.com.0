Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE77E7C7C
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 14:22:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BC55C6B47D;
	Fri, 10 Nov 2023 13:22:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8EC3C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 13:22:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AA9mEK9021404; Fri, 10 Nov 2023 14:22:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=dHHAOvvcb5U/RE+Esv0ZCl90i21gzGXXiCiTRb49fhU=; b=dV
 Q8BxWfAb72UrUH625KRl5sDXlGQZuQV/0gRS779wj5lQBCklq588El6Oqut0NR1O
 ekYI03x2pJUzP9HX+VaFEsa1rnz6XJmzlHNBFq5vrJT6Fb8KTp1vi4e+6v5YfBZZ
 14VMdpNpc53MaEKbgRVD4Zw5Y1lfhxfC5Y9nPZjGFdFStei/CsSLgJ5uH2YvvI4A
 JlczkKSiNYjkucrbehs5NEeJEjCNfvfRvqiMCdWRdrV1FpmxMLYRyJi6J3xSWy+k
 HUWbBCP1AilKN+QkZZcXwaXDQW93GhmwPOjkOK9+GsRBKCTnlt2p4/8wcPA3yz33
 ijZkN3A5R6hccZEqD2UA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u84a5n1n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 14:22:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4355100056;
 Fri, 10 Nov 2023 14:22:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE14D25E53B;
 Fri, 10 Nov 2023 14:22:13 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 14:22:13 +0100
Message-ID: <62deaf31-6fbb-4c34-a0a1-0742ad68e17d@foss.st.com>
Date: Fri, 10 Nov 2023 14:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-6-patrice.chotard@foss.st.com>
 <1498c114-1fa9-4519-82ee-2eb54f02a831@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <1498c114-1fa9-4519-82ee-2eb54f02a831@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_10,2023-11-09_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v1 5/9] stm32mp: bsec: Fix AARCH64
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

CgpPbiAxMS85LzIzIDEwOjE0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEwLzI3LzIzIDE2OjQzLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IFdoZW4gYnVpbGRpbmcg
d2l0aCBBQVJDSDY0IGRlZmNvbmZpZywgd2UgZ290IHdhcm5pbmdzLCBmaXggdGhlbS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5j
b20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvYnNlYy5jIHwgMjkgKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Pgo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERl
bGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJp
Y2sKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbmV4dAoKVGhhbmtzClBhdHJpY2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK
