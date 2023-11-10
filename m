Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E57A7E7C77
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 14:20:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB75DC6B44F;
	Fri, 10 Nov 2023 13:20:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41B3AC6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 13:20:54 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AA9mEJt021404; Fri, 10 Nov 2023 14:20:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=SkpJ65dFskSeS6TTsFHaipi0F6nycEuCJl49ZqQMKvw=; b=ta
 nALpOu4rxTrjyNElJQfsJIodNC4ojjNjC+Ftt2CQ54mxPzmQZVywUa7QSXcY9OcJ
 y/FPMU5slE7+9xXHCRR8bxqEw/A4JxH/Za8GU90h6nISCvI4DGcj1sxvDSrKweXb
 EM5sg6qHoLNnvAb0okSlZCeS9bXnXf8eePU++u1S3WccY6TfT+0BHQri3aV/KwqA
 FosDWo5AagtgNIstvoKEMnjis+hENoCSxg9YrR1Fv2GfmqntNadv1+L9ZyTor5Xj
 Ec8+fnqQZp9IkRtMuPvmSPPhSEMxVelrc7meyr80a8TR3Krgjc6D/DnZUCa0gx52
 lEvRw6FmXtjIFIaC5ZjQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u84a5n1fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 14:20:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8880100056;
 Fri, 10 Nov 2023 14:20:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A193A25E53B;
 Fri, 10 Nov 2023 14:20:51 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 14:20:51 +0100
Message-ID: <533af786-67af-4918-9f8d-ca3055241cab@foss.st.com>
Date: Fri, 10 Nov 2023 14:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-3-patrice.chotard@foss.st.com>
 <8febd85e-b390-46c2-b75b-fc4e75122718@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <8febd85e-b390-46c2-b75b-fc4e75122718@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_10,2023-11-09_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/9] stm32mp: dram_init: Get RAM size
 from DT if no RAM driver found
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

CgpPbiAxMS85LzIzIDEwOjExLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEwLzI3LzIzIDE2OjQyLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEZyb206IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KPj4KPj4gSW4gY2FzZSB0aGVyZSBpcyBu
byBSQU0gZHJpdmVyIHJldHJpZXZlIFJBTSBzaXplIGZyb20gRFQgYXMgZmFsbGJhY2suCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5z
dC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvZHJhbV9pbml0LmMg
fCA3ICsrKysrLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9kcmFtX2lu
aXQuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9kcmFtX2luaXQuYwo+PiBpbmRleCA3ZjM3YjBk
MmFhMi4uYTFlNzdhNDJlNGYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9k
cmFtX2luaXQuYwo+PiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvZHJhbV9pbml0LmMKPj4g
QEAgLTI0LDggKzI0LDExIEBAIGludCBkcmFtX2luaXQodm9pZCkKPj4gwqDCoMKgwqDCoCBpbnQg
cmV0Owo+PiDCoCDCoMKgwqDCoMKgIHJldCA9IHVjbGFzc19nZXRfZGV2aWNlKFVDTEFTU19SQU0s
IDAsICZkZXYpOwo+PiAtwqDCoMKgIGlmIChyZXQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGxvZ19k
ZWJ1ZygiUkFNIGluaXQgZmFpbGVkOiAlZFxuIiwgcmV0KTsKPj4gK8KgwqDCoCAvKiBpbiBjYXNl
IHRoZXJlIGlzIG5vIFJBTSBkcml2ZXIsIHJldHJpZXZlIEREUiBzaXplIGZyb20gRFQgKi8KPj4g
K8KgwqDCoCBpZiAocmV0ID09IC1FTk9ERVYpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBm
ZHRkZWNfc2V0dXBfbWVtX3NpemVfYmFzZSgpOwo+PiArwqDCoMKgIH0gZWxzZSBpZiAocmV0KSB7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBsb2dfZXJyKCJSQU0gaW5pdCBmYWlsZWQ6ICVkXG4iLCByZXQp
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKg
wqDCoMKgwqAgcmV0ID0gcmFtX2dldF9pbmZvKGRldiwgJnJhbSk7Cj4gCj4gCj4gUmV2aWV3ZWQt
Ynk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4g
VGhhbmtzCj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9uZXh0CgpUaGFua3MK
UGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpV
Ym9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby91Ym9vdC1zdG0zMgo=
